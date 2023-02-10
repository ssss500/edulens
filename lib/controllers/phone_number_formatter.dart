

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneNumberFormatter extends MaskTextInputFormatter {
  static String maskA = "###########";

  PhoneNumberFormatter({String? initialText})
      : super(
      mask: maskA,
      filter: {"#": RegExp('[0-9]')},
      initialText: initialText);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (getMask() != maskA) {
      updateMask(mask: maskA);
    }

    return super.formatEditUpdate(oldValue, newValue);
  }
}
class CodeFormatter extends MaskTextInputFormatter {
  static String maskA = "###################################################";

  CodeFormatter({String? initialText})
      : super(
      mask: maskA,
      filter: {"#": RegExp('[0-9]')},
      initialText: initialText);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (getMask() != maskA) {
      updateMask(mask: maskA);
    }

    return super.formatEditUpdate(oldValue, newValue);
  }
}
