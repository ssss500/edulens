import 'dart:async';
import 'dart:io';

import 'package:edu_lens/controllers/video_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/model/courses_models/pdf_model.dart';
import 'package:edu_lens/view/widget/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

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

  @override
  void initState() {
    super.initState();

    debugPrint("to json : ${widget.pdfModel.toJson().toString()}");
    ApiService.loadPDF(
            "https://www.edu-lens.com/books/${widget.pdfModel.file}")
        .then((value) {
      setState(() {
        localfile = value;
        debugPrint(localfile);
      });
    });
    //    Timer.periodic(Duration(seconds: 600), (timer) {
//      createInterstitialAd()
//        ..load()
//        ..show();
//    });
  }

//  BannerAd createBannerAd() {
//    return BannerAd(
//        adUnitId: BannerAd.testAdUnitId,
////        adUnitId: Platform.isAndroid?"ca-app-pub-8681995394812610/4095680920": 'ca-app-pub-8681995394812610/6933592368',
//        size: AdSize.smartBanner,
//        targetingInfo: targetingInfo,
//        listener: (MobileAdEvent event) {
//          print("BannerAd $event");
//        });
//  }
  @override
  Widget build(BuildContext context) {
//    AdmobBannerSize bannerSize = AdmobBannerSize.SMART_BANNER(context);
    return CustomAppBar(
        title: widget.pdfModel.title,
        widget: Stack(
          children: <Widget>[
            (localfile != null)
                ? Container(
                    child: PDFView(
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
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                    color: AppConstants.primaryColor,
                  )),
          ],
        ));

    // Scaffold(
    // appBar: AppBar(
    //   centerTitle: true,
    //   title: Text('عنوان الملف'),
    //   // leading: IconButton(
    //   //   icon: Icon(Icons.arrow_back_ios),
    //   //   onPressed: () {
    //   //     Navigator.pop(context);
    //   //   },
    //   // ),
    //   actions:pdfModel.downloadFile as bool
    //       ? [
    //     Obx(() => !pdfModel.files.cast<String>().contains("${pdfModel.title}.pdf")
    //         ? IconButton(
    //       icon: const Icon(Icons.download_rounded),
    //       onPressed: () => pdfModel.download2(),
    //     )
    //         : IconButton(
    //       icon: const Icon(Icons.share),
    //       onPressed: () {
    //         Share.shareFiles([pdfModel.localFile.value], text: pdfModel.title);
    //       },
    //     )),
    //   ]
    //       : [],
    //   backgroundColor: AppConstants.primaryColor,
    // ),
    // body:
    // floatingActionButton: Row(
    //   mainAxisAlignment: MainAxisAlignment.end,
    //   children: <Widget>[
    //     currentpages > 0
    //         ? CustomButton(
    //             function: () {
    //               currentpages -= 1;
    //               mycontroller.setPage(currentpages);
    //             },
    //             height: 50,
    //             width: 50,
    //             text: '<',
    //           )
    //         : Offstage(),
    //     SizedBox(
    //       width: 30,
    //     ),
    //     currentpages < totalpages - 1
    //         ? CustomButton(
    //             function: () {
    //               currentpages += 1;
    //               mycontroller.setPage(currentpages);
    //             },
    //             height: 50,
    //             width: 50,
    //             text: '>',
    //           )
    //         : Offstage(),
    //   ],
    // ),
    // );
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
