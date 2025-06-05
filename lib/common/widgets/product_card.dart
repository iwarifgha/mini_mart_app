import 'package:flutter/material.dart';
import 'package:mini_mart_app/common/models/product_model.dart';
import 'package:mini_mart_app/common/utils/text_styles.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;
  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 162,
            width:
                MediaQuery.of(context).size.width / 2 -
                32, // 2 items per row, minus padding
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Image.asset(
                product.imageUrl,
                height: 120,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 162,
            child: Text(
              product.name,
              style: textStyleBlack.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: textStyleBlack.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
