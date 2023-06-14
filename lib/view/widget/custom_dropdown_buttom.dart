import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/widget/custom_drop_down.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropdownButton extends StatelessWidget {
  String hint;
  Function(String?) function;
  double width;
  List<String> items;
  bool isMobile;

  CustomDropdownButton({
    super.key,
    this.hint = '',
    this.width = 300,
    required this.items,
    required this.function,
    this.isMobile = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 45,
      child: CustomDropdownButton2(
        iconEnabledColor: Colors.black,
        iconSize: 15,
        icon: Icon(
          isMobile
              ? Icons.arrow_drop_down_circle_outlined
              : Icons.keyboard_arrow_down_rounded,
          color: AppConstants.primaryColor,
          size: 25,
        ),
        buttonWidth: MediaQuery.of(context).size.width - 60,
        // hint: hint,
        hint: CustomText(
          text: hint,
          fontSize: 20,
          color: Colors.black,
          alignment: Alignment.centerRight,
        ),
        dropdownWidth: isMobile
            ? MediaQuery.of(context).size.width - 150
            : MediaQuery.of(context).size.width * 0.183,
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white24,
          border: Border.all(
            color: AppConstants.primaryColor,
          ),
        ),
        dropdownItems: items,
        value: null,
        onChanged: function,
      ),
    );
  }
}
