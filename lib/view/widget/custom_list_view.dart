import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double padding;
  final Axis axis;
  final bool scroll;

  CustomListView({this.scroll=true,required this.itemCount, required this.itemBuilder, this.padding=10,this.axis=Axis.vertical});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: padding),
      scrollDirection: axis,
      primary: false,
      shrinkWrap: true,
      physics: scroll? const AlwaysScrollableScrollPhysics():const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
