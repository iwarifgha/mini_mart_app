import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_mart_app/common/models/product_model.dart';
import 'package:mini_mart_app/common/utils/notifier.dart';
import 'package:mini_mart_app/common/utils/text_styles.dart';
import 'package:mini_mart_app/common/widgets/app_button.dart';
import 'package:mini_mart_app/common/widgets/toast_widget.dart';
import 'package:mini_mart_app/features/cart/view/cart_view.dart';
import 'package:mini_mart_app/features/home/common/widgets/header.dart';

class ProductDetailView extends StatelessWidget {
  static const String routeName = '/product-details';
  final ProductModel product;

  const ProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: Header(
          pageName: 'Go back',
          address: 'GRA, Port Harcourt, rivers',
          onBellTap: () {},
          showSearchBar: false,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Card with Heart Icon
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Image.asset(
                    product.imageUrl,
                    width: MediaQuery.sizeOf(context).width - 40,
                    height: 331,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              //fav-icon
              Positioned(
                top: 12,
                right: 30,
                child: InkWell(
                  onTap: () {
                    product.isFavorited = !product.isFavorited;
                  },
                  borderRadius: BorderRadius.circular(24),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: Icon(
                      product.isFavorited
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: product.isFavorited ? Colors.red : Colors.black54,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
          // Product Name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              product.name,
              style: textStyleBlack.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 10),
          // Product Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: textStyleBlack.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          // About Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'About this item',
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  product.bulletDescription
                      .map(
                        (point) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "• ",
                                style: TextStyle(fontSize: 18, height: 1.3),
                              ),
                              Expanded(
                                child: Text(
                                  point,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    height: 1.4,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: AppButton(
          buttonName: 'Add to cart',
          onPressed: () {
            Notifier.showNotifier(
              context,
              type: NotificationType.messenger,
              content: ToastWidget(
                onDismiss: () {
                  Notifier.removeNotifier();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
