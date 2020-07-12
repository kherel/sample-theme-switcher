import 'package:application/service/providers/barrier_effect_visibility.dart';
import 'package:application/service/providers/screen_tools_visibility.dart';
import 'package:application/ui_helper/widgets/visible.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BarrierContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BarrierContainer();
}

class _BarrierContainer extends State<BarrierContainer> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _fadeInFadeout;
  bool visibleContainer = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 750));
    _fadeInFadeout = Tween<double>(begin: 0.0, end: 1).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BarrierEffectVisibility>(
      builder: (context, visible, child) => ValueListenableProvider.value(
        value: visible.barrierVisibility,
        child: Consumer<bool>(
          builder: (context, value, child) {
            visibleContainer = value;
            if (value) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
            return Visible(
              visibility: visibleContainer ? VisibilityFlag.visible : VisibilityFlag.gone,
              child: FadeTransition(
                opacity: _fadeInFadeout,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
