import 'package:flutter/material.dart';
import 'package:mini_mart_app/common/utils/color_utils.dart';
import 'package:mini_mart_app/common/utils/functions.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final List<_NavItemData> items = [
      _NavItemData(icon: 'home', label: "Home"),
      _NavItemData(icon: 'shopping-cart', label: "Cart"),
      _NavItemData(icon: 'favourite', label: "Favorites"),
      _NavItemData(icon: 'user-circle', label: "Profile"),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          final isSelected = index == currentIndex;
          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50,
                  padding: const EdgeInsets.all(8),
                  decoration:
                      isSelected
                          ? BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(18),
                          )
                          : null,
                  child: svgIcon(
                    assetName: items[index].icon,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  items[index].label,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.lightBlueAccent : Colors.black54,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _NavItemData {
  final String icon;
  final String label;
  _NavItemData({required this.icon, required this.label});
}
