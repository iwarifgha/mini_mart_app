import 'package:flutter/material.dart';

class ToastWidget extends StatelessWidget {
  final VoidCallback onDismiss;

  const ToastWidget({super.key, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      color: Colors.transparent,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: BorderDirectional(start: BorderSide(color: Colors.green, width: 2)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                //color: Colors.green.shade100,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.green, width: 2),
              ),
              padding: const EdgeInsets.all(6),
              child: const Icon(Icons.check, color: Colors.green, size: 20),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Item has been added to cart',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2E3A59),
                ),
              ),
            ),
            GestureDetector(
              onTap: onDismiss,
              child: const Icon(Icons.close, color: Color(0xFF2E3A59)),
            ),
          ],
        ),
      ),
    );
  }
}
