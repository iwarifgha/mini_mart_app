import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A reusable method to load SVG icons from assets.
///
/// Example:
/// ```dart
/// svgIcon('assets/icons/cart.svg', size: 24, color: Colors.black)
/// ```
Widget svgIcon(
  {
    required String assetName, 
  
  double size = 24,
  Color? color,
  BoxFit fit = BoxFit.contain,
  Alignment alignment = Alignment.center,
}) {
  return SvgPicture.asset(
    'assets/icons/$assetName.svg',
    width: size,
    height: size,
    colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    fit: fit,
    alignment: alignment,
  );
}
