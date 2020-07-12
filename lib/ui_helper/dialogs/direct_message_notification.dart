import 'package:application/core/app_theme.dart';
import 'package:application/ui_helper/dialogs/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DirectMessageNotification extends StatelessWidget {
    final VoidCallback onReplay;
    final String message;
    final bool enableBottomLayer;
    final bool enableHeaderLayer;

    const DirectMessageNotification({Key key, this.onReplay, @required this.message, this.enableBottomLayer, this.enableHeaderLayer}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        final double notificationHeight = MediaQuery.of(context).size.height * 0.500;
        List<PopupMenu> choices = <PopupMenu>[
            PopupMenu(title: 'Home', icon: Icons.home),
            PopupMenu(title: 'Bookmarks', icon: Icons.bookmark),
            PopupMenu(title: 'Settings', icon: Icons.settings),
        ];

        return SafeArea(
            child: Material(
                color: Colors.transparent,
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Container(
                                margin: const EdgeInsets.all(10.0),
                                height: notificationHeight,
                                width: double.infinity,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5.0), boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 0.9,
                                        spreadRadius: 0.5,
                                        offset: const Offset(0.0, 0.0),
                                    ),
                                ]),
                                child: Column(
                                    children: <Widget>[
                                        Container(
                                            width: double.infinity,
                                            height: notificationHeight - 40,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: const BorderRadius.only(
                                                    topRight: Radius.circular(5.0),
                                                    topLeft: Radius.circular(5.0),
                                                )),
                                            child: Padding(
                                                padding: const EdgeInsets.only(top: 8.0, right: 16.0, left: 16.0),
                                                child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                        Padding(
                                                            padding: const EdgeInsets.only(right: 5.0, bottom: 3.0),
                                                            child: Row(
                                                                children: <Widget>[
                                                                    Text(
                                                                        message,
                                                                        style: AppTheme.of(context).caption().copyWith(color: Colors.black, fontFamily: 'IranSansLight'),
                                                                    ),
                                                                    const Spacer(),
                                                                    Material(
                                                                        type: MaterialType.transparency,
                                                                        child: IconButton(
                                                                            icon: Icon(Icons.archive,size: 20.0,color: Colors.black,),
                                                                            onPressed: () {
                                                                                PopupMenuButton<PopupMenu>(
                                                                                    elevation: 3.2,
                                                                                    initialValue: choices[1],
                                                                                    onCanceled: () {
                                                                                        print('You have not chossed anything');
                                                                                    },
                                                                                    tooltip: 'This is tooltip',
                                                                                    itemBuilder: (BuildContext context) {
                                                                                        return choices.map((PopupMenu choice) {
                                                                                            return PopupMenuItem<PopupMenu>(
                                                                                                value: choice,
                                                                                                child: Text(choice.title),
                                                                                            );
                                                                                        }).toList();
                                                                                    },
                                                                                );
                                                                            },
                                                                        ),
                                                                    ),
                                                                ],
                                                            ),
                                                        ),
                                                        TextFormField(
                                                            textDirection: TextDirection.rtl,
                                                            textAlign: TextAlign.start,
                                                            keyboardType: TextInputType.multiline,
                                                            maxLines: 7,
                                                            style: AppTheme.of(context).caption().copyWith(
                                                                fontFamily: 'IranSansLight',
                                                                color: Colors.black,
                                                            ),
                                                            textInputAction: TextInputAction.next,
                                                            autovalidate: true,
                                                            decoration: InputDecoration(
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(width: 1, color: Colors.purple),
                                                                ),
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(color: Colors.purple, width: 0.0),
                                                                ),
                                                                errorBorder: const OutlineInputBorder(
                                                                    borderSide: BorderSide(color: Colors.red, width: 0.0),
                                                                ),
                                                                contentPadding: const EdgeInsets.all(5.0),
                                                                errorStyle: Theme.of(context).textTheme.overline.copyWith(
                                                                    fontFamily: 'IranSansLight',
                                                                    color: Colors.black,
                                                                ),
                                                                hintText: 'abcd',
                                                                hintStyle: Theme.of(context).textTheme.overline.copyWith(fontFamily: 'IranSansLight',color:Colors.grey),
                                                                border: const OutlineInputBorder(
                                                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                                                ),
                                                            )),
                                                        Center(
                                                            child: Directionality(
                                                                textDirection: TextDirection.ltr,
                                                                child: RaisedButton.icon(
                                                                    icon: Icon(FontAwesomeIcons.chevronCircleLeft,size: 20.0,),
                                                                    color: Colors.white,
                                                                    label: Text(
                                                                        "ارسال پیام دایرکت به مخاطب",
                                                                        style: AppTheme.of(context).caption().copyWith(fontFamily: 'IranSansLight', color: Colors.black),
                                                                    ),
                                                                    onPressed: () {
                                                                        if (onReplay != null) onReplay();
                                                                    },
                                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))),
                                                            ),
                                                        ),
                                                    ],
                                                ),
                                            ),
                                        ),
                                        Container(
                                            height: 40,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Colors.black26,
                                                borderRadius: const BorderRadius.only(
                                                    bottomRight: Radius.circular(5.0),
                                                    bottomLeft: Radius.circular(5.0),
                                                )),
                                            child: Row(
                                                children: <Widget>[
                                                    Checkbox(
                                                        value: true,
                                                        onChanged: (bool value) {},
                                                    ),
                                                    Text(
                                                        'برای استفاده در ارسالهای بعدی در آرشیو شود',
                                                        textAlign: TextAlign.right,
                                                        style: AppTheme.of(context).caption().copyWith(
                                                            fontFamily: 'IranSansLight',
                                                            color: Colors.black,
                                                        ),
                                                    )
                                                ],
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ),
                    ),
                ),
            ),
        );
    }
}
