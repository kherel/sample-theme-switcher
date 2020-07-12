import 'package:application/core/app_theme.dart';
import 'package:flutter/material.dart' show Axis, BorderRadius, BorderSide, BoxDecoration, BoxShadow, BoxShape, BuildContext, Card, Clip, ClipRRect, Color, Colors, Column, Container, CrossAxisAlignment, Divider, EdgeInsets, Expanded, Image, InputDecoration, ListView, MainAxisAlignment, MainAxisSize, Offset, OutlineInputBorder, Padding, Radius, RoundedRectangleBorder, Row, SizedBox, Stack, StatelessWidget, Text, TextFormField, TextInputAction, TextInputType, TextStyle, Widget;

class PopupSendSimpleComment extends StatelessWidget{
   final List<String> emojies = [
      '😂',
      '😍',
      '😜',
      '😊',
      '😳',
      '😘',
      '❤',
      '🌹',
      '😡',
      '😭',
      '👍',
      '💪',
   ];
   @override
   Widget build(BuildContext context) {
      return  Row(
         children: <Widget>[
            Expanded(
               child: Container(
                  margin: const EdgeInsets.all(10.0),
                  color: Colors.transparent,
                  height: 160,
                  child: Container(
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: const BorderRadius.only(
                            topRight: Radius.circular( 10 ),
                            topLeft: Radius.circular( 10 ),
                            bottomLeft: Radius.circular( 25 ),
                            bottomRight: Radius.circular( 25 ), ),
                         boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity( 0.5 ),
                                offset: const Offset( 0.0, 0.0 ),
                                spreadRadius: 0.2
                            ),
                         ] ),
                     child: Column(
                        children: <Widget>[
                           Container(
                              height:60.0,
                              child: Card(
                                 clipBehavior: Clip.antiAliasWithSaveLayer,
                                 color: Colors.grey[200],
                                 elevation: 0.0,
                                 shape:const RoundedRectangleBorder(
                                     borderRadius: BorderRadius.only(
                                        topLeft:Radius.circular(8),
                                        topRight:Radius.circular(4),
                                        bottomLeft:Radius.circular(5),
                                        bottomRight:Radius.circular(4),
                                     )
                                 ),
                                 child: Row(
                                    children: <Widget>[
                                       Container(
                                          width: 5.0,
                                          color:Colors.purple[400],
                                       ),
                                       Expanded(
                                          child: Padding(
                                             padding: const EdgeInsets.symmetric( horizontal: 5.0 ),
                                             child: Row(
                                                children: <Widget>[
                                                   Padding(
                                                      padding: const EdgeInsets.all(3.0),
                                                      child: ClipRRect(
                                                          borderRadius:BorderRadius.circular(5.0),
                                                          child: Image.asset('assets/images/mahdi_pishguy.jpg')),
                                                   ),
                                                   Container(
                                                      margin: const EdgeInsets.only( right: 8.0 ),
                                                      child: Column(
                                                         mainAxisAlignment: MainAxisAlignment.center,
                                                         crossAxisAlignment: CrossAxisAlignment.start,
                                                         children: <Widget>[
                                                            Padding(
                                                               padding: const EdgeInsets.symmetric( vertical: 2.0 ),
                                                               child: Text( 'مهدی پیشگوی',style: AppTheme.of(context).caption(), ),
                                                            ),
                                                            Row(
                                                               mainAxisAlignment: MainAxisAlignment.start,
                                                               crossAxisAlignment: CrossAxisAlignment.center,
                                                               children: <Widget>[
                                                                  Text(
                                                                     '۷۵۳',
                                                                     style: AppTheme.of(context).caption().copyWith(fontFamily: 'ShabnamBold'),
                                                                  ),
                                                                  Padding(
                                                                     padding: const EdgeInsets.only(left: 8.0, right: 5.0),
                                                                     child: Text(
                                                                        'لایک',
                                                                        style: AppTheme.of(context).caption().copyWith(fontFamily: 'IranYekan'),
                                                                     ),
                                                                  ),
                                                                  Text(
                                                                     '۳۴',
                                                                     style: AppTheme.of(context).caption().copyWith(fontFamily: 'ShabnamBold'),
                                                                  ),
                                                                  Padding(
                                                                     padding: const EdgeInsets.only(left: 8.0, right: 5.0),
                                                                     child: Text(
                                                                        'کامنت',
                                                                        style: AppTheme.of(context).caption().copyWith(fontFamily: 'IranYekan'),
                                                                     ),
                                                                  ),
                                                               ],
                                                            ),
                                                         ],
                                                      ),
                                                   ),
                                                ],
                                             ),
                                          ),
                                       ),
                                    ],
                                 ),
                              ),
                           ),
                           const Divider(
                               height: 1.0
                           ),
                           Container(
                              padding: const EdgeInsets.only( top: 4.0 ),
                              margin: const EdgeInsets.symmetric( horizontal: 15.0 ),
                              height: 45.0,
                              child: TextFormField(
                                 keyboardType: TextInputType.text,
                                 style: AppTheme.of( context ).caption( ).copyWith( color: Colors.black ,fontFamily: 'IranYekan'),
                                 textInputAction: TextInputAction.next,
                                 decoration: InputDecoration(
                                     focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide( width: 0.0, color: Colors.white ),
                                     ),
                                     enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide( width: 0.0, color: Colors.white ),
                                     ),
                                     hintText: 'نظر خودتان را در این قسمت کامنت کنید',
                                     hintStyle: AppTheme.of( context ).caption( ).copyWith( color: Colors.black,fontFamily: 'IranYekan' ),
                                     contentPadding: const EdgeInsets.all(5.0) ),
                                 maxLines: 1, ),
                           ),
                           const Divider(
                               height: 10.0
                           ),
                           Expanded(
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                     return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text( emojies[index], style: const TextStyle( fontSize: 25.0 ), ),
                                     );
                                  },
                                  separatorBuilder: (context, index) {
                                     return Stack(
                                        children: <Widget>[
                                           Container(
                                              margin: const EdgeInsets.only(top:10.0),
                                              width: 6.0,
                                              height: 6.0,
                                              decoration: BoxDecoration(
                                                 color: Colors.black12,
                                                 shape: BoxShape.circle,
                                              ),
                                           )
                                        ],
                                     );
                                  },
                                  itemCount: emojies.length ),
                           )
                        ],
                     ),
                  ),
               ),
            ),
            Column(
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                  const SizedBox(
                     height: 100.0,
                  ),
                  Container(
                      width: 50.0,
                      height: 50.0,
                      margin: const EdgeInsets.only( left: 10.0 ),
                      decoration: BoxDecoration(
                          color: const Color( 0xff00887a ),
                          borderRadius: BorderRadius.circular( 25.0 ) ),
                      child: Image.asset('assets/images/icons/send.png')),
               ],
            )
         ],
      );
   }
}