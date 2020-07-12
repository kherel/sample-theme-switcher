import 'package:flutter/material.dart';

class RightFollowersList extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return RightCustomShapeBorder(
			icon: Icons.adjust,
			color: Colors.white.withOpacity(0.5),
			onTap: () {
				print('=========== onTap ===========');
			},
			onLongPress: () {
				print('=========== onLongPress ===========');
			},
			alignment: const Alignment(1, 0.30),
		);
	}
}

class RightCustomShapeBorder extends StatelessWidget {
	final Size thumbSize;
	final Alignment alignment;
	final double barWidth;
	final GestureTapCallback onTap;
	final GestureLongPressCallback onLongPress;
	final IconData icon;
	final Color color;

	const RightCustomShapeBorder({
		this.thumbSize = const Size(35, 35 * 2.75),
		this.alignment = Alignment.bottomRight,
		this.barWidth = 4,
		this.onTap,
		this.onLongPress,
		this.icon,
		this.color,
	});

	@override
	Widget build(BuildContext context) {
		final shape = CustomShapeBorder(thumbSize, alignment, barWidth);
		return Material(
			shape: shape,
			color: color ?? Theme.of(context).primaryColor,
			elevation: 4,
			child: InkWell(
				customBorder: shape,
				onTap: onTap,
				onLongPress: onLongPress,
				child: Container(
					alignment: alignment,
					padding: EdgeInsets.only(right: barWidth),
					child: Container(
						width: thumbSize.width,
						height: thumbSize.height,
						alignment: Alignment.centerRight,
						child: Icon(icon),
					),
				),
			),
		);
	}
}

class CustomShapeBorder extends ShapeBorder {
	final Size thumbSize;
	final Alignment alignment;
	final double barWidth;

	const CustomShapeBorder(
			this.thumbSize,
			this.alignment,
			this.barWidth,
			);

	@override
	Path getInnerPath(Rect rect, {TextDirection textDirection}) => _getPath(rect);

	@override
	Path getOuterPath(Rect rect, {TextDirection textDirection}) => _getPath(rect);

	Path _getPath(Rect rect) {
		final delta = thumbSize.width;
		final ctrl = delta * 0.75;
		final th2 = thumbSize.height / 2;
		final thumbRect = alignment.inscribe(thumbSize + Offset(barWidth, 0), rect);
		final bar = Rect.fromLTWH(thumbRect.right - barWidth, rect.top, barWidth, rect.height);
		return Path()
			..moveTo(thumbRect.right - barWidth, thumbRect.top)
			..relativeCubicTo(0, ctrl, -delta, th2 - ctrl, -delta, th2)
			..relativeCubicTo(0, ctrl, delta, th2 - ctrl, delta, th2)
			..addRect(bar)
			..close();
	}

	@override
	EdgeInsetsGeometry get dimensions {
		return const EdgeInsets.all(0);
	}

	@override
	ShapeBorder scale(double t) {
		return CustomShapeBorder(thumbSize, alignment, barWidth);
	}

	@override
	void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}
}
