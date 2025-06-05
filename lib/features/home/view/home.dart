import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_mart_app/common/utils/text_styles.dart';
import 'package:mini_mart_app/common/widgets/product_card.dart';
import 'package:mini_mart_app/features/details/view/product_details_view.dart';
import 'package:mini_mart_app/features/home/common/widgets/header.dart';
import 'package:mini_mart_app/services/product_list.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: Header(
          pageName: 'Technology',
          address: 'GRA, Port Harcourt, rivers',
          onBellTap: () {
            // Handle bell tap
          },
          showSearchBar: true,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Smartphones, Tablets & Accessories',
                style: textStyleBlack.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Wrap(
              spacing: 24,
              runSpacing: 24,
              children:
                  productList.map((product) {
                    return ProductCard(
                      product: product,
                      onTap: () {
                        print('Tapped on ${product.name}');
                        context.push(
                          ProductDetailView.routeName,
                          extra: product,
                        );
                      },
                    );
                  }).toList(),
            ),
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(16.0),
            //     child: GridView.builder(
            //       itemCount: productImages.length,
            //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         mainAxisSpacing: 24,
            //         crossAxisSpacing: 24,
            //         childAspectRatio: 1,
            //       ),
            //       itemBuilder: (context, index) {
            //         return Container(
            //           decoration: BoxDecoration(
            //             color: Colors.grey.shade100,
            //             borderRadius: BorderRadius.circular(24),
            //           ),
            //           child: Center(
            //             child: Image.asset(
            //               productImages[index],
            //               height: 120,
            //               fit: BoxFit.contain,
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
