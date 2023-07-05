import 'dart:io';

import 'package:edu_lens/view/widget/custom_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../controllers/pdf_controller.dart';
import '../../../helper/app_constants.dart';
import '../../../model/courses_models/pdf_model.dart';
import '../pdf_mobile/pdf_view.dart';

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

    if (!widget.pdfController.files
        .cast<String>()
        .contains("${widget.pdfModel.title}.pdf")) {
      debugPrint("to json : ${widget.pdfModel.toJson().toString()}");
      ApiService.loadPDF(
              "https://www.edu-lens.com/books/${widget.pdfModel.file}")
          .then((value) {
        setState(() {
          widget.localfile = value;
          debugPrint("localfile : $widget.localfile");
        });
      });
    } else {
      final files = Directory(widget.pdfController.path)
          .listSync()
          .map((e) => e.uri.path)
          .toList();
      widget.localfile =
          "${widget.pdfController.path}/${widget.pdfModel.title}.pdf";

      // files[pdfController.files
      //     .indexOf("${widget.pdfModel.title}.pdf")];
      debugPrint("localfile : $widget.localfile");
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
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
          SizedBox(
              height: MediaQuery.sizeOf(context).height - 150,
              width: MediaQuery.sizeOf(context).width - 150,
              child: Stack(
                children: <Widget>[
                  (widget.localfile != null)
                      ?

                  SfPdfViewer.file(
                          File(widget.localfile),
                          key: widget.pdfController.pdfViewerKey,
                      canShowScrollHead: false,
                      canShowScrollStatus: false,
                      pageLayoutMode: PdfPageLayoutMode.single
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                          color: AppConstants.primaryColor,
                        )),
                ],
              )),
        ],
      ),
    );
  }
}
