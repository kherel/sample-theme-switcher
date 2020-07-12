import 'package:application/ui_helper/widgets/build_top_pages_icons.dart';
import 'package:application/ui_helper/widgets/resizable_text_field.dart';
import 'package:application/ui_helper/widgets/visible.dart';
import 'package:flutter/material.dart'
    show
    BuildContext,
    required,
    Colors,
    Container,
    StatefulWidget,
    Widget,
    Column,
    MainAxisAlignment,
    CrossAxisAlignment,
    Directionality,
    Stack,
    State,
    TextDirection;

class CommentLayout extends StatefulWidget {
  final bool fullScreen;

  const CommentLayout({@required this.fullScreen});

  @override
  _CommentLayoutState createState() => _CommentLayoutState();
}

class _CommentLayoutState extends State<CommentLayout> {
  bool showBarrier = false;

  bool get _fullScreen => widget.fullScreen;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BuildTopPagesIcons(),
              ResizableTextField(),
            ],
          ),
          Visible(
            visibility: showBarrier ? VisibilityFlag.visible : VisibilityFlag.gone,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
