import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomText extends StatelessWidget {
  final String text;

  final double fontSize;

  final Color color;
  final maxLines;
  final Alignment alignment;
  var textDirection, softWrap;
  final TextOverflow textOverflow;
  var heightContainer, widthContainer;
  final double height;
  final FontWeight fontWeight;
  var textAlign;

  CustomText({super.key,
    this.text = '',
    this.fontSize = 16,
    this.softWrap = true,
    this.textOverflow = TextOverflow.visible,
    this.color = Colors.black,
    this.alignment = Alignment.center,
    this.textDirection = TextDirection.rtl,
    this.height = 1,
    this.maxLines,
    this.heightContainer,
    this.widthContainer,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      height: heightContainer,
      width: widthContainer,
      child: AutoSizeText(
        text,
        textAlign: textAlign,
        textDirection: textDirection,
        overflow: textOverflow,
        softWrap: softWrap,
        maxLines: maxLines,
        style: TextStyle(
          fontWeight: fontWeight,
          color: color,
          height: height,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
