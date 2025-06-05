import 'package:flutter/material.dart';
import 'package:mini_mart_app/common/utils/functions.dart';

class Header extends StatelessWidget {
  final String address;
  final VoidCallback? onBellTap;
  final bool showSearchBar;
  final String pageName;

  const Header({
    super.key,
    required this.address,
    this.onBellTap,
    required this.showSearchBar,
    required this.pageName,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        SizedBox(height: 20),
        //Logo and address section
        Container(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/Logo.png', height: 30),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'DELIVERY ADDRESS',
                    style: theme.textTheme.labelMedium?.copyWith(
                      letterSpacing: 1.4,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface.withOpacity(.6),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    address,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              svgIcon(
                assetName: 'notification',
                size: 24,
                color: theme.colorScheme.onSurface.withOpacity(.7),
              ),
            ],
          ),
        ),
        //Search bar section
        if (showSearchBar)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: theme.colorScheme.surface,
                hintText: 'Search for products',
                prefixIcon: Icon(
                  Icons.search,
                  color: theme.colorScheme.onSurface,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        //Bottom bar
        DecoratedBox(
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            border: Border.symmetric(
              horizontal: BorderSide(color: theme.dividerColor),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: theme.colorScheme.onPrimary,
                    size: 24,
                  ),
                ),
                Text(
                  pageName,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
