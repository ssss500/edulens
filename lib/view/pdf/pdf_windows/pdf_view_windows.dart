import 'dart:io';

import 'package:edu_lens/view/widget/custom_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share_plus/share_plus.dart';
import '../../../controllers/pdf_controller.dart';
import '../../../helper/app_constants.dart';
import '../../../model/courses_models/pdf_model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewWindows extends StatefulWidget {
  PdfViewWindows({Key? key}) : super(key: key);
  PdfModel pdfModel = Get.arguments['pdfModel'];

  PDFController pdfController = Get.put(PDFController());
  var localfile;

  @override
  State<PdfViewWindows> createState() => _PdfViewWindowsState();
}

class _PdfViewWindowsState extends State<PdfViewWindows> {

  @override
  void initState() {
    super.initState();
    debugPrint("pdfModel ${widget.pdfModel.toJson()}");
  }

  getPdf() async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomBackground(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  // SizedBox(
                  //   width: MediaQuery.sizeOf(context).width * 0.15,
                  // ),
                  Text(
                    widget.pdfController.title!,
                    style: const TextStyle(
                        color: AppConstants.lightPrimaryColor, fontSize: 23),
                  ),
                  // SizedBox(
                  //   width: MediaQuery.sizeOf(context).width * 0.15,
                  // ),
                  widget.pdfModel.canDownload == 1
                      ? Obx(() => !widget.pdfController.files
                              .cast<String>()
                              .contains("${widget.pdfModel.title}.pdf")
                          ? IconButton(
                              icon: const Icon(Icons.download_rounded),
                              onPressed: () => widget.pdfController.download2(),
                            )
                          : IconButton(
                              icon: const Icon(Icons.share),
                              onPressed: () {
                                Share.shareFiles([widget.localfile],
                                    text: widget.pdfModel.title);
                              },
                            ))
                      : const SizedBox(),
                ],
              ),
            ),
            Expanded(
              child: SfPdfViewer.network(
                 "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf",
                enableDocumentLinkAnnotation: false,   canShowScrollHead: false, canShowScrollStatus: false,enableDoubleTapZooming: false,),
                 // "https://www.edu-lens.com/books/${widget.pdfModel.file}"),
            ),
          ],
        ),
      ),
    );
  }
}
