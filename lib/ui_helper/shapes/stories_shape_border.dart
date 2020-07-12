import 'package:application/ui_helper/shapes/right_shape_border.dart';
import 'package:flutter/material.dart';

class FeedsActivitiesShapeBorder extends StatelessWidget {
  final Size thumbSize;
  final Alignment alignment;
  final double barWidth;
  final IconData icon;
  final Color color;

  const FeedsActivitiesShapeBorder({this.thumbSize = const Size(33, 33 * 2.75), this.alignment = Alignment.bottomRight, this.barWidth = 4, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    final shape = RightShapeBorder(thumbSize, alignment, barWidth);
    return Material(
      shape: shape,
      color: color ?? Theme.of(context).primaryColor,
      elevation: 4,
      child: Container(
        alignment: alignment,
        padding: EdgeInsets.only(right: barWidth + 1.0),
        child: Container(
          width: thumbSize.width,
          height: thumbSize.height,
          alignment: Alignment.centerRight,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
