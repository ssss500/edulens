import 'package:edu_lens/helper/app_constants.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
 const  NextButton(
      {Key? key,
      required this.function,
      required this.icon,
      this.color = AppConstants.primaryColor,
      this.iconColor = Colors.white})
      : super(key: key);
  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: color,
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
