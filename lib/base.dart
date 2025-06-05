import 'package:flutter/material.dart';
import 'package:mini_mart_app/common/widgets/nav_bar.dart';
import 'package:mini_mart_app/features/cart/view/cart_view.dart';
import 'package:mini_mart_app/features/home/view/home.dart';

class Base extends StatefulWidget {
  static const String routeName = '/base';
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomeView(),
    CartView(),

    const Center(child: Text("Favorites Page")),
    const Center(child: Text("Profile Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[selectedIndex],
      bottomNavigationBar: NavBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() => selectedIndex = index);
        },
      ),
    );
  }
}
