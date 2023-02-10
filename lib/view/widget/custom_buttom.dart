import 'package:edu_lens/helper/app_constants.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final double width, height, borderRadius,sizeText;
  final String text;
  final Function function;
  final Color colorButton, colorText;
  final FontWeight fontWeight;

  const CustomButton(
      {super.key, this.width = 250,
      this.height = 50,
      this.borderRadius = 50,
      this.sizeText = 24,
      this.text = "",
      required this.function,
      this.colorButton = AppConstants.primaryColor,
      this.colorText = Colors.white,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () =>function(),
        child: Container(
            width: width,
            height: height,
            alignment: Alignment.center,

            decoration: BoxDecoration(
              color: colorButton,
              borderRadius:  BorderRadius.circular(borderRadius),
            ),
            child:   CustomText(
              text: text,
              fontSize: sizeText,
              color: colorText,
              fontWeight: fontWeight,
            )));
  }
}
