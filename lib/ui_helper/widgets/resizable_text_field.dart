import 'package:application/core/app_theme.dart';
import 'package:flutter/material.dart'
    show
    BuildContext,
    Colors,
    Offset,
    Container,
    BorderRadius,
    StatefulWidget,
    Widget,
    Radius,
    State,
    Row,
    EdgeInsets,
    BoxShadow,
    Expanded,
    TextField,
    MainAxisAlignment,
    Column,
    GestureDetector,
    InputDecoration,
    OutlineInputBorder,
    BoxDecoration,
    BorderSide,
    IconButton,
    Icons,
    AnimatedContainer,
    SizedBox,
    Icon,
    MediaQuery;

class ResizableTextField extends StatefulWidget {
    @override
    _ResizableTextFieldState createState() => _ResizableTextFieldState();
}

class _ResizableTextFieldState extends State<ResizableTextField> {
    final double _minHeight = 80, _dividerHeight = 46, _offset = 19;
    double  _height = 80;
    int _maxLines = 1;
    double _maxHeight;
    static const Duration _fixDuration = Duration(milliseconds: 500);
    Duration _duration = _fixDuration;

    @override
    void didChangeDependencies() {
        super.didChangeDependencies();
        _maxHeight = MediaQuery.of(context).size.height * 0.4;
    }

    @override
    Widget build(BuildContext context) {
        return SizedBox(
            height: _maxHeight,
            child: Column(
                children: <Widget>[
                    AnimatedContainer(
                        duration: _duration,
                        height: _height,
                        child: Container(
                            margin: const EdgeInsets.all(10.0),
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 0.5,
                                        spreadRadius: 0.5,
                                        offset: const Offset(0.0, 0.0),
                                    ),
                                ],
                            ),
                            child: Row(
                                children: <Widget>[
                                    Expanded(
                                        child: TextField(
                                            style: AppTheme.of(context).caption(),
                                            decoration: InputDecoration(
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(width: 0.0, color: Colors.transparent),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(width: 0.0, color: Colors.transparent),
                                                ),
                                                contentPadding: const EdgeInsets.all(5.0),
                                                errorStyle: AppTheme.of(context).caption(),
                                                prefixIcon: Icon(Icons.search),
                                                hintText: 'aaaa',
                                                hintStyle: AppTheme.of(context).caption(),
                                                border: const OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                                ),
                                            ),
                                            maxLines: _maxLines,
                                        ),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(left:10.0),
                                        width: 1.0,
                                        height: double.infinity,
                                        color: Colors.grey.withOpacity(0.5),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.send),
                                        onPressed: (){},
                                    ),
                                ],
                            ),
                        ),
                    ),
                    Container(
                        height: _dividerHeight,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                                IconButton(
                                    icon: Icon(Icons.arrow_downward),
                                    onPressed: () {
                                        if (_height <= _maxHeight - _offset - _dividerHeight) {
                                            setState(() {
                                                _duration = _fixDuration;
                                                _height += _offset;
                                                _maxLines++;
                                            });
                                        }
                                    },
                                ),
                                GestureDetector(
                                    onPanUpdate: (details) {
                                        setState(() {
                                            _height += details.delta.dy;
                                            _duration = Duration.zero;

                                            // prevent overflow if height is more/less than available space
                                            final maxLimit = _maxHeight - _dividerHeight;
                                            const minLimit = 80.0;

                                            if (_height > maxLimit) {
                                                _height = maxLimit;
                                            } else if (_height < minLimit) _height = minLimit;

                                            _maxLines = 100;
                                        });
                                    },
                                    child: Icon(Icons.drag_handle),
                                ),
                                IconButton(
                                    icon: Icon(Icons.arrow_upward),
                                    onPressed: () {
                                        if (_height >= _minHeight + _offset) {
                                            setState(() {
                                                _duration = _fixDuration;
                                                _height -= _offset;
                                            });
                                        }
                                    },
                                ),
                            ],
                        ),
                    )
                ],
            ),
        );
    }
}