import 'package:flutter/material.dart';
import 'package:mini_mart_app/common/utils/color_utils.dart';

class AppButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  const AppButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: primaryColor,
          //Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
