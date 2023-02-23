// import 'dart:io';

import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dio/dio.dart';
import 'package:edu_lens/view/pdf_view.dart';
import 'package:edu_lens/view/widget/custom_dialog/snackBar.dart';
import 'package:edu_lens/view/widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PDFController extends GetxController {
  String? pdfUrl, title, type;
  bool? night ;

  int? totalPages;
  int? currentPages;
  RxInt progress = 0.obs;

//  var dio;

  late String path;

  RxString localFile = ''.obs;

  loadPDF() async {
    // print(link);
    print("file is donloded ${!files.cast<String>().contains("$title.pdf")}");
    if (!files.cast<String>().contains("$title.pdf")) {
      ApiService.loadPDF("https://www.edu-lens.com/books/$pdfUrl").then((value) {
        localFile.value = value;
        localFile.refresh();
        print(localFile.runtimeType);
      });
    } else {
      localFile.value = "$path/$title.pdf";
      localFile.refresh();
    }
  }

  ////download pdf
  @override
  Future<void> onInit() async {
    await getPate();
   await getAllPdfSaved();

    // TODO: implement onReady
    super.onInit();
  }

  getPate() async {
    if (Platform.isAndroid) {
      path = "/storage/emulated/0/Download/";
      debugPrint("path : $path");
    } else {
      Directory directory = await getApplicationDocumentsDirectory();
      path = directory.path;
    }
  }

  RxList files = [].obs;

  getAllPdfSaved() async {
    debugPrint("get Path ${path}");
    files.value =
        Directory(path).listSync().map((e) => e.uri.pathSegments.last).toList();

    files.refresh();
    debugPrint("files : $files");
  }

  Future download2() async {
    //get pdf from link
    await Permission.storage.shouldShowRequestRationale;
    Dio dio = Dio();

    if (!await Permission.speech.isPermanentlyDenied) {
      if (await Permission.storage.request().isGranted) {
        progress = 0.obs;
        try {
          Directory directory = await getApplicationDocumentsDirectory();
          final files = Directory(directory.path)
              .listSync()
              .map((e) => e.uri.pathSegments.last)
              .toList();
          debugPrint("files : $files");

          Get.dialog(Obx(
            () => CustomLoading(
              textLoading: "${progress.value} %",
            ),
          ));
          await dio.download("https://www.edu-lens.com/books/$pdfUrl", "$path/$title.pdf",
              onReceiveProgress: (receivedBytes, totalBytes) {
            progress.value = ((receivedBytes / totalBytes) * 100).toInt();
            progress.refresh();
            debugPrint(progress.value.toString());
          });
          Get.back();
          if (Platform.isAndroid) {
            showCustomSnackBar(
                context: Get.context,
                title: "note".tr,
                deck: "تم تحميل الملف بنجاح في ملف التحميلات",
                contentType: ContentType.success);
          } else {
            showCustomSnackBar(
                context: Get.context,
                title: "note".tr,
                deck: "تم تحميل الملف بنجاح",
                contentType: ContentType.success);
          }
         await getAllPdfSaved();
          debugPrint("done");
        } catch (e) {
          debugPrint("error $e");
        }

      } else {
        debugPrint("false1");
      }
    } else {
      openAppSettings();

     }
  }

  showDownloadProgress(received, total) {
    if (total != -1) {
      debugPrint((received / total * 100).toStringAsFixed(0) + "%");
    }
  }
}
