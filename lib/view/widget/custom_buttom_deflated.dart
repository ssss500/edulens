// import 'package:connectivity/connectivity.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';


class CustomButtonDeflated extends StatelessWidget {
  final Function function;
  final String text;
  final double height, width,fontSize;
  final Color color;

  const CustomButtonDeflated(
      {required this.function,
      required this.text,
      this.height = 30,
      this.fontSize = 16,
      this.width = 130,
      this.color = AppConstants.primaryColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {function();},
        child:   Container(
            width:width ,
            height: height,
            decoration:   BoxDecoration(
              color: Colors.white,
              border:   Border.all(color: color, width: 2.0),
              borderRadius:   BorderRadius.circular(50.0),
            ),
            child:   Center(
                child: CustomText(
              text: text,
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ))));
  }
}
