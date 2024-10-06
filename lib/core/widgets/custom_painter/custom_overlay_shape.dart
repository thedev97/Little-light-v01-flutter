import 'package:flutter/material.dart';

class CustomOverlayShape extends SliderComponentShape {
  final double overlayRadius;
  final Color borderColor;
  final double borderWidth;

  const CustomOverlayShape({
    required this.overlayRadius,
    required this.borderColor,
    this.borderWidth = 2.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(overlayRadius);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    final Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final Paint fillPaint = Paint()
      ..color = sliderTheme.overlayColor ?? Colors.teal.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final double radius = overlayRadius * activationAnimation.value;

    canvas.drawCircle(center, radius, fillPaint);
    canvas.drawCircle(center, radius, borderPaint);
  }
}
