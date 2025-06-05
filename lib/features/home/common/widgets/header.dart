import 'package:flutter/material.dart';
import 'package:mini_mart_app/common/utils/functions.dart';
import 'package:mini_mart_app/common/utils/text_styles.dart';

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
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 10, right: 10),
      child: Column(
        children: [
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
                      style: textStyleBlack.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      address,
                      textAlign: TextAlign.center,
                      style: textStyleBlack.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                svgIcon(assetName: 'notification', size: 24),
              ],
            ),
          ),
          //Search bar section
          if (showSearchBar) ...[
            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 5, top: 15),
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300, width: 1.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  // filled: true,
                  // fillColor: Colors.grey.shade200,
                  hintText: 'Search',
                  hintStyle: textStyleBlack.copyWith(
                    fontSize: 14,
                    color: Colors.grey.shade300,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade100),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],

          SizedBox(height: 10),

          //Bottom bar
          Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.symmetric(
                horizontal: BorderSide(color: Colors.grey.shade300, width: 1.0),
              ),
            ),

            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  pageName,
                  style: textStyleBlack.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
