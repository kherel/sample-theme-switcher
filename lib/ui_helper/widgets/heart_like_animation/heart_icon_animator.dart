import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeartIconAnimator extends StatefulWidget {
  final bool isLiked;
  final double size;
  final VoidCallback onTap;
  final Stream<void> triggerAnimationStream;

  const HeartIconAnimator({
    @required this.isLiked,
    this.size = 24.0,
    @required this.onTap,
    this.triggerAnimationStream,
  });

  @override
  _HeartIconAnimatorState createState() => _HeartIconAnimatorState();
}

class _HeartIconAnimatorState extends State<HeartIconAnimator> with SingleTickerProviderStateMixin {
  AnimationController _likeController;
  Animation<double> _likeAnimation;

  @override
  void initState() {
    super.initState();
    const quick = Duration(milliseconds: 500);
    final scaleTween = Tween(begin: 0.0, end: 1.0);
    _likeController = AnimationController(duration: quick, vsync: this);
    _likeAnimation = scaleTween.animate(
      CurvedAnimation(
        parent: _likeController,
        curve: Curves.elasticOut,
      ),
    );
    _likeController.animateTo(1.0, duration: Duration.zero);

    if (widget.triggerAnimationStream != null) {
      widget.triggerAnimationStream.listen((_) => _animate());
    }
  }

  @override
  void dispose() {
    _likeController.dispose();
    super.dispose();
  }

  void _animate() {
    _likeController
      ..reset()
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return _TapableHeart(
      isLiked: widget.isLiked,
      size: widget.size,
      onTap: () {
        _animate();
        widget.onTap();
      },
      animation: _likeAnimation,
    );
  }
}

class _TapableHeart extends AnimatedWidget {
  final bool isLiked;
  final double size;
  final VoidCallback onTap;
  final Animation<double> animation;

  const _TapableHeart({
    Key key,
    @required this.isLiked,
    @required this.size,
    @required this.onTap,
    @required this.animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation, //
      child: GestureDetector(
        onTap: onTap,
        child: isLiked ? Icon(Icons.favorite, size: size, color: Colors.red) : Icon(Icons.favorite_border, size: size),
      ),
    );
  }
}
