import 'package:flutter/material.dart';

import '../../helper/app_constants.dart';
import 'custom_drop_down.dart';
import 'custom_text.dart';
class DropDownComponent extends StatelessWidget {
   DropDownComponent({Key? key,this.hint = '',
    this.width = 270,
    required this.items,
    required this.function,}) : super(key: key);
  String hint;
  Function(String?) function;
  double width;
  List<String> items;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 45,
      child: CustomDropdownButton2(
        iconEnabledColor: Colors.black,
        iconSize: 15,
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppConstants.primaryColor,
          size: 25,
        ),
        buttonWidth: MediaQuery.of(context).size.width*0.183,
        // hint: hint,
        hint:  CustomText(
          text: hint,
          fontSize: 20,
          color: Colors.grey,
          alignment: Alignment.centerRight,
        ),
        dropdownWidth: MediaQuery.of(context).size.width * 0.183,
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
