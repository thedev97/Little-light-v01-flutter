import 'package:flutter/material.dart';
import 'custom_painter/custom_overlay_shape.dart';
import 'custom_painter/custom_thumb_shape.dart';
import 'custom_painter/custom_track_shape.dart';
import 'mobx/progress_store.dart';

class CustomProgressBar extends StatefulWidget {
  final ProgressStore store;

  const CustomProgressBar({super.key, required this.store});

  @override
  CustomProgressBarState createState() => CustomProgressBarState();
}

class CustomProgressBarState extends State<CustomProgressBar> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackShape: const CustomTrackShape(
          borderColor: Colors.black,
          borderWidth: 2.0,
        ),
        trackHeight: 4.0,
        thumbShape: const CustomThumbShape(
          thumbRadius: 8.0,
          borderColor: Colors.black,
          borderWidth: 2.0,
        ),
        overlayShape: const CustomOverlayShape(
          overlayRadius: 2.0,
          borderColor: Colors.black,
          borderWidth: 2.0,
        ),
        activeTrackColor: Colors.teal,
        inactiveTrackColor: Colors.grey[300],
        thumbColor: Colors.teal,
        overlayColor: Colors.teal.withOpacity(0.2),
      ),
      child: Slider(
        value: widget.store.progressValue,
        onChanged: (value) {
          widget.store.updateProgress(value);
        },
      ),
    );
  }
}
