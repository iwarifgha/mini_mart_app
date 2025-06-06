import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_mart_app/common/widgets/nav_bar.dart';
import 'package:mini_mart_app/features/cart/state/cart_state.dart';
import 'package:mini_mart_app/features/cart/view/cart_view.dart';
import 'package:mini_mart_app/features/home/view/home.dart';

class Base extends ConsumerStatefulWidget {
  static const String routeName = '/base';
  const Base({super.key});

  // @override
  // ConsumerState<ConsumerStatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }

  @override
  ConsumerState<Base> createState() => _BaseState();
}

class _BaseState extends ConsumerState<Base> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomeView(),
    CartView(),
    const Center(child: Text("Favorites Page")),
    const Center(child: Text("Profile Page")),
  ];

  @override
  Widget build(BuildContext context) {
    ref.watch(cartStateProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() => selectedIndex = index);
        },
      ),
    );
  }
}
