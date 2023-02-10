import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  String hint;
  Function(String?) function;
  double width;
  List<String> items;

  CustomDropdownButton({
    super.key,
    this.hint = '',
    this.width = 300,
    required this.items,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 45,
      child: CustomDropdownButton2(
        iconEnabledColor: Colors.black,
        iconSize: 15,
        icon: const Icon(
          Icons.arrow_drop_down_circle_outlined,
          color: AppConstants.primaryColor,
          size: 25,
        ),
        buttonWidth: MediaQuery.of(context).size.width - 60,
        // hint: hint,
        hint:  CustomText(
          text: hint,
          fontSize: 20,
          color: Colors.black,
          alignment: Alignment.centerRight,
        ),
        dropdownWidth: MediaQuery.of(context).size.width - 150,
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
