import 'package:edu_lens/helper/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CustomTextFieldLogin extends StatelessWidget {
  final String? hint, title;
  final Function(String)? function;
  final TextEditingController? controller;
  final IconData? iconData;
  final TextInputType? textInputType;
  final Color? color, colorBorder, colorTextInput;
  final int? maxLength;
  final double? width;
  bool isMobile;

  // ignore: prefer_typing_uninitialized_variables
  final inputFormatters, autoFillHints;
  FormFieldValidator? validator;
  final Color? colorIcon;

  CustomTextFieldLogin(
      {super.key,
      this.hint,
      this.isMobile = true,
      this.title = '',
      this.color = Colors.black26,
      this.width = 300,
      this.colorBorder = Colors.white54,
      this.colorTextInput = Colors.black,
      this.colorIcon = AppConstants.primaryColor,
      this.function,
      this.maxLength,
      this.controller,
      this.iconData,
      this.autoFillHints,
      this.inputFormatters,
      this.validator,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 70,
    margin: isMobile?const EdgeInsets.symmetric(vertical: 5, horizontal: 20): const EdgeInsets.all(0),
    //  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          TextFormField(
            style: TextStyle(fontSize: 20, color: colorTextInput),
            keyboardType: textInputType,
            textAlign: TextAlign.right,
            onChanged: function,
            controller: controller,
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            validator: validator,
            autofillHints: autoFillHints,
            decoration: InputDecoration(
              suffixIcon: Icon(
                iconData,
                color: colorIcon,
              ),
              errorText: null,
              errorStyle: TextStyle(
                fontSize: 0,
                color: Colors.red.shade400,
                inherit: false,

                // fontWeight: FontWeight.bold,
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
                right: 25,
              ),
              filled: true,
              fillColor: Colors.white24,
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 18,
                color: color,
                // fontWeight: FontWeight.bold,
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
          isMobile
              ? Positioned(
                  right: 20,
                  top: 1,
                  child: UnconstrainedBox(
                    child: Container(
                      height: 20,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppConstants.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "$title",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                  ),
                )
              : const SizedBox(
                  height: 0,
                  width: 0,
                ),
        ],
      ),
    );
  }
}
