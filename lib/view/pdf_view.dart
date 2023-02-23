import 'dart:async';
import 'dart:io';

import 'package:edu_lens/controllers/pdf_controller.dart';
import 'package:edu_lens/controllers/video_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/model/courses_models/pdf_model.dart';
import 'package:edu_lens/view/widget/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class PdfView extends StatefulWidget {
  PdfModel pdfModel;

  PdfView({required this.pdfModel});

  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  var localfile;
  bool night = false;
  int totalpages = 0;
  int currentpages = 0;
  late PDFViewController mycontroller;
  PDFController pdfController = Get.put(PDFController());

  @override
  void initState() {
    super.initState();

    if(!pdfController.files
        .cast<String>()
        .contains("${widget.pdfModel.title}.pdf")){
    debugPrint("to json : ${widget.pdfModel.toJson().toString()}");
    ApiService.loadPDF(
            "https://www.edu-lens.com/books/${widget.pdfModel.file}")
        .then((value) {
      setState(() {
        localfile = value;
        debugPrint("localfile : $localfile");
      });
    });
  }else{
      final files =
      Directory(pdfController.path).listSync().map((e) => e.uri.path).toList();
      localfile ="${pdfController.path}/${widget.pdfModel.title}.pdf";

      // files[pdfController.files
      //     .indexOf("${widget.pdfModel.title}.pdf")];
      debugPrint("localfile : $localfile");

    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        title: widget.pdfModel.title,
        iconRight: widget.pdfModel.canDownload == 1
            ? Obx(() => !pdfController.files
                    .cast<String>()
                    .contains("${widget.pdfModel.title}.pdf")
                ? IconButton(
                    icon: const Icon(Icons.download_rounded),
                    onPressed: () => pdfController.download2(),
                  )
                : IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {
                      Share.shareFiles([localfile],
                          text: widget.pdfModel.title);
                    },
                  ))
            : const SizedBox(),
        // ignore: unnecessary_null_comparison
        widget: Stack(
          children: <Widget>[
            (localfile != null)
                ? PDFView(
                  autoSpacing: true,
                  nightMode: false,
                  // swipeHorizontal: true,
                  filePath: localfile,
                  onRender: (pages) {
                    setState(() {
                      totalpages = pages!;
                    });
                  },
                  onViewCreated: (PDFViewController vc) {
                    mycontroller = vc;
                  },
                  onPageChanged: (int? page, int? total) {
                    setState(() {});
                  },
                )
                : const Center(
                child: CircularProgressIndicator(
                  color: AppConstants.primaryColor,
                )),
          ],
        ),);
  }
}

class ApiService {
  static Future<String> loadPDF(String link) async {
    debugPrint(link);
    var response = await http.get(Uri.parse(link));
    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + "/data.pdf");
    await file.writeAsBytes(response.bodyBytes, flush: true);
    return file.path;
  }
}
