

import 'package:edu_lens/controllers/pdf_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../responsive.dart';
import '../pdf_mobile/pdf_view.dart';
import '../pdf_windows/pdf_view_windows.dart';

class PdfViewCommon extends GetView<PDFController> {
  const PdfViewCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Responsive(
        mobile: PdfView(), desktop: PdfViewWindows());
  }
}
