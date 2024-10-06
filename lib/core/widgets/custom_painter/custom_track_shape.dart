import 'package:flutter/material.dart';

class CustomTrackShape extends SliderTrackShape {
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;

  const CustomTrackShape({
    required this.borderColor,
    this.borderWidth = 2.0,
    this.borderRadius = 4.0,
  });

  @override
  void paint(PaintingContext context, Offset offset,
      {required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required Animation<double> enableAnimation,
        required Offset thumbCenter,
        Offset? secondaryOffset,
        bool? isEnabled,
        bool? isDiscrete,
        required TextDirection textDirection}) {
    final Rect trackRect =
    Offset(offset.dx, offset.dy) & Size(parentBox.size.width, 4);

    final Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final Paint activePaint = Paint()
      ..color = sliderTheme.activeTrackColor ?? Colors.teal
      ..style = PaintingStyle.fill;

    final Paint inactivePaint = Paint()
      ..color = sliderTheme.inactiveTrackColor ?? Colors.grey[300]!
      ..style = PaintingStyle.fill;

    final double activeWidth = trackRect.width *
        (thumbCenter.dx / parentBox.size.width).clamp(0.0, 1.0);
    final Rect activeRect = Rect.fromLTRB(trackRect.left, trackRect.top,
        trackRect.left + activeWidth, trackRect.bottom);

    // Draw the inactive track with rounded corners
    context.canvas.drawRRect(
      RRect.fromRectAndRadius(trackRect, Radius.circular(borderRadius)),
      inactivePaint,
    );

    // Draw the active track with rounded corners
    context.canvas.drawRRect(
      RRect.fromRectAndRadius(activeRect, Radius.circular(borderRadius)),
      activePaint,
    );

    // Draw the border with rounded corners
    context.canvas.drawRRect(
      RRect.fromRectAndRadius(trackRect.inflate(borderWidth / 2), Radius.circular(borderRadius)),
      borderPaint,
    );
  }

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = true,
    bool isDiscrete = false,
  }) {
    const double trackHeight = 4.0;
    final double width = parentBox.size.width;
    const double height = trackHeight;

    return Rect.fromLTWH(
      offset.dx,
      offset.dy + (parentBox.size.height - height) / 16,
      width,
      height,
    );
  }
}
