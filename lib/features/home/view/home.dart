import 'package:flutter/material.dart';
import 'package:mini_mart_app/features/home/common/widgets/header.dart';
import 'package:mini_mart_app/services/product_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Header(
          pageName: 'Technology',
          address: 'GRA, Port Harcourt',
          onBellTap: () {
            // Handle bell tap
          },
          showSearchBar: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: productImages.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Image.asset(
                  productImages[index],
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
