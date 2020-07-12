import 'package:application/core/app_theme.dart';
import 'package:application/core/theme_manager.dart';
import 'package:flutter/material.dart'
    show AnimatedContainer, AppBar, BorderRadius, BuildContext, Center, ClipRRect, Color, Colors, Container, DefaultTabController, Directionality, Divider, EdgeInsets, Icon, IconButton, Icons, ListTile, ListView, MediaQuery, Offset, Radius, RaisedButton, RoundedRectangleBorder, Row, Scaffold, Shadow, ShapeDecoration, SizedBox, Spacer, State, StatefulWidget, Tab, TabBar, TabBarIndicatorSize, TabBarView, Text, TextDirection, TextOverflow, Widget, required;
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:provider/provider.dart';

import 'comment_layout.dart';

class CommentMessageDialog extends StatefulWidget {
  final bool fullScreen;
  final bool fromTop;

  const CommentMessageDialog({@required this.fullScreen, @required this.fromTop});

  @override
  _CommentMessageDialog createState() => _CommentMessageDialog();
}

class _CommentMessageDialog extends State<CommentMessageDialog> {
  Color left = Colors.white;
  Color right = Colors.black;
  bool _fullScreen;

  @override
  void initState() {
    super.initState();
    _fullScreen = widget.fullScreen;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder:(context,theme,child)=> AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: Container(
          height: _fullScreen ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.height * 0.7,
          child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    appBar: AppBar(
                        title: Row(
                          children: <Widget>[
                            Text( 'ارسال کامنت',
                                style: AppTheme.of( context ).caption( ).copyWith(
                                  fontFamily: 'Ghasem',
                                  color: theme.appBarTitleTextColor,
                                  fontSize: 26.0,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity( 1 ),
                                      offset: const Offset( 0.0, 0.0 ),
                                      blurRadius: 5.0,
                                    ),
                                  ],
                                ) ),
                            const Spacer(),
                            IconButton(
                              icon: Icon(_fullScreen ? Icons.fullscreen_exit : Icons.fullscreen, size: 25.0, color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  _fullScreen = !_fullScreen;
                                });
                              },
                            ),
                          ],
                        ),
                        bottom: TabBar(
                          labelPadding: const EdgeInsets.all(0.0),
                          labelColor: Colors.white,
                          indicator: const MD2Indicator( //it begins here
                              indicatorHeight: 3,
                              indicatorColor: Colors.white,
                              indicatorSize: MD2IndicatorSize.full //3 different modes tiny-normal-full
                          ),
                          tabs: [
                            Tab(
                                child: Text(
                                  'کامنت پیشرفته',
                                  style: AppTheme.of(context).caption().copyWith(color: Colors.white, fontFamily: 'IranSansLight'),
                                )),
                            Tab(
                                child: Text(
                                  'آرشیو',
                                  style: AppTheme.of(context).caption().copyWith(color: Colors.white, fontFamily: 'IranSansLight'),
                                )),
                            Tab(
                                child: Text(
                                  'تنظیمات',
                                  style: AppTheme.of(context).caption().copyWith(color: Colors.white, fontFamily: 'IranSansLight'),
                                ))
                          ],
                        )),
                    body: TabBarView(
                      children: [
                        CommentLayout(fullScreen: _fullScreen),
                        Container(
                            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    ' خیلی خوب بود خیلی خوب بود خیلی خوب بود خیلی خوب بود خیلی خوب بود',
                                    overflow: TextOverflow.clip,
                                    style: AppTheme.of(context).caption().copyWith(fontFamily: 'IranYekan', color: Colors.black),
                                  ),
                                  trailing: SizedBox(
                                    width: 65.0,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.remove_circle, size: 20.0, color: Colors.red),
                                        const SizedBox(
                                          width: 20.0,
                                        ),
                                        Icon(Icons.edit, size: 20.0, color: Colors.indigo),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: 10,
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                            )),
                        Center(
                          child: RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                            onPressed: () {},
                            child: Text(
                              'ثبت و ارسال کامنت',
                              style: AppTheme.of(context).caption(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
