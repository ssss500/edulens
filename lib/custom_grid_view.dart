import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double padding;
  final Axis axis;
  final bool scroll;
  final int crossAxisCount;
  const CustomGridView(
      {super.key,
      this.scroll = true,
        this.crossAxisCount=2,
      required this.itemCount,
      required this.itemBuilder,
      this.padding = 10,
      this.axis = Axis.vertical});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(bottom: padding),
      scrollDirection: axis,
      primary: false,
      shrinkWrap: true,
      physics: scroll
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
    );
  }
}
