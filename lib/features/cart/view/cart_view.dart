import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_mart_app/common/widgets/app_button.dart';
import 'package:mini_mart_app/features/cart/common/cart_info_box.dart';
import 'package:mini_mart_app/features/cart/common/cart_item_card.dart';
import 'package:mini_mart_app/features/home/common/widgets/header.dart';
import 'package:mini_mart_app/services/product_list.dart';

class CartView extends StatelessWidget {
  static const String routeName = '/cart';
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
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
        itemCount: cartItems.length + 1, // +1 for total section
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          if (index < cartItems.length) {
            final item = cartItems[index];
            return CartItemCard(
              cartItem: item,
              onAdd: () {},
              onRemove: () {},
              onDelete: () {},
            );
          } else {
            // Total section
            return CartInfoBox();
          }
        },
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: AppButton(
          buttonName: 'Checkout (\$2453)',
          onPressed: () {
            context.push(CartView.routeName);
          },
        ),
      ),
    );
  }
}
