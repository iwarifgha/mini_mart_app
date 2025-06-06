import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_mart_app/common/utils/color_utils.dart';
import 'package:mini_mart_app/common/utils/functions.dart';
import 'package:mini_mart_app/common/utils/text_styles.dart';
import 'package:mini_mart_app/features/cart/state/cart_state.dart';

class BottomNavBar extends ConsumerWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<_NavItemData> items = [
      _NavItemData(icon: 'home', label: "Home"),
      _NavItemData(icon: 'shopping-cart', label: "Cart"),
      _NavItemData(icon: 'favourite', label: "Favorites"),
      _NavItemData(icon: 'user-circle', label: "Profile"),
    ];

    final cart = ref.read(cartStateProvider);
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
                  child: Center(
                    child: Stack(
                      children: [
                        Positioned(
                          child: svgIcon(
                            assetName: items[index].icon,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        if (index == 1 && cart.items.isNotEmpty)
                          Container(
                            height: 24,
                            width: 24,
                            transform: Matrix4.translationValues(10, -10, 0),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${cart.items.length}',
                                style: textStyleWhite,
                              ),
                            ),
                          ),
                      ],
                    ),
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
