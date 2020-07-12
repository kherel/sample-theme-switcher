import 'package:application/core/constants.dart';
import 'package:flutter/material.dart'
    show Align, Alignment, Animation, BoxDecoration, BuildContext, Color, Colors, Container, CurvedAnimation, Curves, DragStartDetails, DragUpdateDetails, EdgeInsets, Expanded, FadeTransition, GestureDetector, LinearGradient, Material, MediaQuery, Navigator, Offset, Opacity, Padding, PageRoute, RouteSettings, Row, SafeArea, SlideTransition, Tween, Widget, required;

enum directions { rightToLeft, leftToRight, bottomToTop, topToBottom }

class PopupRoutes extends PageRoute<int> {
  static Future<int> show(BuildContext context, Widget nestedChild, directions slideDirection, bool draggableToClose) {
    return Navigator.of(context).push<int>(PopupRoutes(
      context: context,
      nestedChild: nestedChild,
      direction: slideDirection,
      barrierColor: Colors.black38,
        draggableToClose:draggableToClose
    ));
  }

  PopupRoutes({
    this.context,
    RouteSettings settings,
    @required this.nestedChild,
    @required this.barrierColor,
    @required this.direction,
    @required this.draggableToClose,
  }) : super(settings: settings);

  final BuildContext context;
  final Widget nestedChild;
  final directions direction;
  final bool draggableToClose;

  @override
  bool get opaque => false;

  @override
  bool get maintainState => true;

  @override
  bool get barrierDismissible => true;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel = '';

  @override
  Duration get transitionDuration => const Duration(milliseconds: 250);

  double position = 0.0;
  double initX;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    Offset animateDirection = animateFromBottom;
    if (direction == directions.rightToLeft) {
      animateDirection = animateFromRight;
    } else if (direction == directions.leftToRight) {
      animateDirection = animateFromLeft;
    } else if (direction == directions.bottomToTop) {
      animateDirection = animateFromBottom;
    } else if (direction == directions.topToBottom) {
      animateDirection = animateFromTop;
    }
    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: (_) {
        if (position < -0.01) {
          setState(() {
            position = 0;
          });
        } else if (position >= 0.5) {
          setState(() {
            position = 1;
            Navigator.of(context).pop();
          });
        } else if (position < 5.0) {
          setState(() {
            position = 0;
          });
        }
      },
      child: SafeArea(
        child: FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn),
          child: SlideTransition(
              position: Tween<Offset>(
                begin: animateDirection,
                end: Offset(position, 0),
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.fastLinearToSlowEaseIn,
              )),
              // ignore: void_checks
              child: Row(
                children: <Widget>[
                  if (position >= 0.02)
                    Container(
                        width: 3.0,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [Colors.black.withOpacity(0.2), Colors.transparent])))
                  else
                    Container(),
                  Expanded(child: child),
                ],
              )),
        ),
      ),
    );
  }

  void handleXChange(double deltaX) {
    if(draggableToClose) {
      setState( () {
        position = deltaX / MediaQuery.of( context ).size.width;
      } );
    }
  }

  void onPanStart(DragStartDetails details) {
    if(draggableToClose) {
      initX = details.globalPosition.dx;
    }
  }

  void onPanUpdate(DragUpdateDetails details) {
    if(draggableToClose) {
      final x = details.globalPosition.dx;
      double deltaX = x - initX ;
      if(deltaX < 0){deltaX = 0;}else {
        handleXChange( deltaX );
      }
    }
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(0.0) + MediaQuery.of(context).viewInsets,
        child: nestedChild,
      ),
    );
  }
}
