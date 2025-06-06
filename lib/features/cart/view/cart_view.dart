import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_mart_app/common/utils/text_styles.dart';
import 'package:mini_mart_app/common/widgets/app_button.dart';
import 'package:mini_mart_app/features/cart/common/cart_info_box.dart';
import 'package:mini_mart_app/features/cart/common/cart_item_card.dart';
import 'package:mini_mart_app/features/cart/state/cart_state.dart';
import 'package:mini_mart_app/features/home/common/widgets/header.dart';

class CartView extends ConsumerWidget {
  static const String routeName = '/cart';
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartStateProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: Header(
          pageName: 'Your cart',
          address: 'GRA, Port Harcourt, rivers',
          onBellTap: () {
            // Handle bell tap
          },
          showSearchBar: false,
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100), // ← extra bottom
        itemCount: cart.items.length + 1, // +1 for order info section
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          if (cart.items.isEmpty) {
            return Center(
              child: Text(
                'No items in cart',
                style: textStyleBlack.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          }
          if (index < cart.items.length) {
            //show cart items only if the item index is less than the total cart length
            final item = cart.items[index];
            return CartItemCard(
              cartItem: item,
              onAdd: () {
                // Handle add action
                ref.read(cartStateProvider.notifier).increaseQuantity(item.id);
              },
              onRemove: () {
                // Handle remove action
                ref.read(cartStateProvider.notifier).decreaseQuantity(item.id);
              },
              onDelete: () {
                // Handle delete action
                ref.read(cartStateProvider.notifier).removeFromCart(item.id);
              },
            );
          } else {
            // Total section
            return CartInfoBox();
          }
        },
      ),
      bottomSheet:
          cart.items.isNotEmpty
              ? Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: AppButton(
                  buttonName: 'Checkout (\$${cart.totalPrice})',
                  onPressed: () {},
                ),
              )
              : SizedBox.shrink(),
    );
  }
}
