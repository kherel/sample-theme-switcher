import 'package:application/core/app_theme.dart';
import 'package:application/core/constants.dart';
import 'package:application/core/theme_manager.dart';
import 'package:application/service/providers/screen_tools_visibility.dart';
import 'package:application/ui_helper/shapes/stories_shape_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RightSidePanel extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_RightSidePanel();
}
class _RightSidePanel extends State<RightSidePanel> with TickerProviderStateMixin{
  AnimationController _animationController;
  AnimationController _panelAnimationController;
  Animation<double> _animation;
  Animation<Offset> _offset;
  final ValueNotifier<bool> _isExpanded = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState( );
    _animationController = AnimationController( vsync: this, duration: const Duration( milliseconds: 500 ) );
    _panelAnimationController = AnimationController( vsync: this, duration: const Duration( milliseconds: 500 ) );
    _animation = CurvedAnimation( parent: _animationController, curve: Curves.fastLinearToSlowEaseIn );
    _offset = Tween<Offset>(
      begin: animateFromRight,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastLinearToSlowEaseIn,
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (context, theme, child) => Consumer<ScreenToolsVisibility>(
        builder:(context,visible,child)=> ValueListenableProvider.value(
          value: visible.screenToolsVisibility,
          child: Consumer<bool>(
            builder: (context,value,child){
              if(value){
                _animationController.reverse();
              }else{
                _animationController.forward();
              }
              return FadeTransition(
                opacity: _animation,
                child: SlideTransition(
                  position: _offset,
                  child: Row(
                    children: <Widget>[
                      ValueListenableBuilder<bool>(
                        valueListenable: _isExpanded,
                        builder: (context, value, child) => AnimatedContainer(
                          curve: value ? Curves.elasticOut : Curves.fastLinearToSlowEaseIn,
                          duration: const Duration(milliseconds: 800),
                          width: value ? MediaQuery.of(context).size.width * 0.7 : 0.5,
                          color: Colors.white,
                          padding: const EdgeInsets.only(bottom: 65.0),
                          child: Column(
                            children: <Widget>[
                              AnimatedBuilder(
                                animation: _panelAnimationController,
                                builder: (_, child) => Visibility(
                                  visible: _panelAnimationController.value != 0,
                                  child: Opacity(
                                    opacity: _panelAnimationController.value,
                                    child: Material(
                                      elevation: 5.0,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 37.0,
                                        color: theme.appMainColor,
                                        child: Text(
                                          'لیست دسته بندیهای دانشنامه',
                                          textAlign: TextAlign.center,
                                          style: AppTheme.of(context).caption().copyWith(fontFamily: 'ShabnamBold', color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedBuilder(
                                animation: _panelAnimationController,
                                builder: (_, child) => Expanded(
                                  child: Visibility(
                                    visible: _panelAnimationController.value != 0,
                                    child: Opacity(
                                      opacity: _panelAnimationController.value,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListView.builder(
                                          physics: const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {},
                                              child: Container(
                                                margin: const EdgeInsets.only(bottom: 8.0),
                                                padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 5.0),
                                                decoration: BoxDecoration(color: Colors.black.withOpacity(0.1), borderRadius: BorderRadius.circular(25.0)),
                                                child: Text(
                                                  'title',
                                                  textAlign: TextAlign.center,
                                                  style: AppTheme.of(context).caption().copyWith(fontFamily: 'IranYekan'),
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount: 5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _isExpanded.value = !_isExpanded.value,
                        child: FeedsActivitiesShapeBorder(
                          alignment: const Alignment(3, 0.50),
                          icon: Icons.adjust,
                          color: theme.appMainColor,
                          barWidth: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
