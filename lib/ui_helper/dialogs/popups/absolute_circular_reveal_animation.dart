import 'package:application/core/app_theme.dart';
import 'package:application/core/components/after_layout.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
class AbsoluteCircularRevealAnimation extends StatefulWidget{
  @override
  _AbsoluteCircularRevealAnimationState createState() => _AbsoluteCircularRevealAnimationState();
}

class _AbsoluteCircularRevealAnimationState extends State<AbsoluteCircularRevealAnimation> with TickerProviderStateMixin, AfterLayoutMixin {
  AnimationController animationController;
  Animation<double> animation;
  final GlobalKey _thisKey = GlobalKey( );
  Size popupMenuSize;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
  }


  @override
  Widget build(BuildContext context) {
    return CircularRevealAnimation(
      animation: animation,
      centerOffset: Offset(popupMenuSize.width/2,0),
      child: Container(
          key: _thisKey,
          width: double.infinity,
          height: 200.0,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.9),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3.0),
                          child: Text('تعداد فالور',
                              style: AppTheme.of(context).caption().copyWith(
                                fontFamily: 'IranYekan',
                                color: Colors.black,
                              )),
                        ),
                        Text('۱۲k',
                            style: AppTheme.of(context).caption().copyWith(
                              fontFamily: 'IranSansLight',
                              color: Colors.black,
                            )),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                              height: 95.0,
                              width: 95.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(50.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3.0,
                                    offset: const Offset( 0.0, 0.0, ),
                                  )
                                ],
                              ),
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Image.asset('assets/images/mahdi_pishguy.jpg', fit: BoxFit.fill),
                                  ))),
                          Positioned(
                            top: 70.0,
                            left: 5.0,
                            child: Container(
                              height: 25.0,
                              width: 25.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(50.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3.0,
                                    offset: const Offset( 0.0, 0.0, ),
                                  )
                                ],
                              ),
                              child: Image.asset('assets/images/icons/verified_account.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3.0),
                          child: Text('تعداد فالوینگ',
                              style: AppTheme.of(context).caption().copyWith(
                                fontFamily: 'IranYekan',
                                color: Colors.black,
                              )),
                        ),
                        Text('۱۱k',
                            style: AppTheme.of(context).caption().copyWith(
                              fontFamily: 'IranSansLight',
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'widget.feed.pageName',
                    style: AppTheme.of(context).caption().copyWith(fontFamily: 'IranSansBold', color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0, bottom: 12.0),
                    child: Text(
                      'این یک نمونه از توضیحات بیوگرافی پیج است',
                      style: AppTheme.of(context).caption().copyWith(fontFamily: 'IranYekan', color: Colors.black),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }


  @override
  void afterFirstLayout(BuildContext context) {
    final RenderBox renderBoxRed = _thisKey.currentContext.findRenderObject() as RenderBox;
    setState(() {
      popupMenuSize = renderBoxRed.size;
    });
  }
}