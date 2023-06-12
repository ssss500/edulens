import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class InputComponent extends StatelessWidget {
  InputComponent({
    Key? key,
    this.controller,
    required this.textInputType,
    required this.function,
    this.maxLength,
    required this.icon,
     this.validator,
    this.color = Colors.black26,
    this.width = 270,
    this.colorBorder = const Color.fromRGBO(0, 202, 220, 1),
    this.colorTextInput = Colors.black,
    this.iconColor = Colors.grey,
    required this.hint,
    this.hintSize = 20.0,
    this.inputFormatters,
  }) : super(key: key);
  final Function(String)? function;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Color? color, colorBorder, colorTextInput;
  final int? maxLength;
  final double? width;
  final IconData icon;
  final Color iconColor;
  final String hint;
  final double hintSize;
  FormFieldValidator? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: TextFormField(
        style: TextStyle(fontSize: 20, color: colorTextInput),
        keyboardType: textInputType,
        textAlign: TextAlign.right,
        onChanged: function,
        controller: controller,
        maxLength: maxLength,
        validator: validator,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey, fontSize: hintSize),
          suffixIcon: Icon(
            icon,
            color: iconColor,
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade400, width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              )),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
            borderSide: BorderSide(color: colorBorder!, width: 1),
          ),
          contentPadding: const EdgeInsets.only(
            right: 20,
            left: 5,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
            borderSide: BorderSide(color: colorBorder!, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorBorder!, width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
