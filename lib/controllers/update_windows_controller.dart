import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_lens/view/widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../view/update_screen.dart';

class UpdateWindowsController extends GetxController {
  static UpdateWindowsController get to => Get.find();
  final _dio = Dio();
  final _downloadProgress = 0.0.obs;
  final _isDownloading = false.obs;
  final _downloadedFilePath = "".obs;
  final _currentVersion = 1.0.obs;

  double get downloadProgress => _downloadProgress.value;

  bool get isDownloading => _isDownloading.value;

  String get downloadedFilePath => _downloadedFilePath.value;

  double get currentVersion => _currentVersion.value;

  Future<Map<String, dynamic>> loadJsonFromGithub() async {
    final response = await http.read(Uri.parse(
        "https://raw.githubusercontent.com/ssss500/edulens/master/app_versions_check/version.json"));
    debugPrint("Response git hub versions : $response");
    return jsonDecode(response);
  }

  Future<void> openExeFile(String filePath) async {
    await Process.start(filePath, ["-t", "-l", "1000"]).then((value) {});
  }

  RxString pr = "0".obs;

  Future downloadNewVersion(String appPath) async {
    _isDownloading.value = true;
    update();
    _downloadedFilePath.value =
        "${(await getApplicationDocumentsDirectory()).path}/edulens_setup.exe";
    Get.dialog(Obx(() => CustomLoading(
          textLoading: "جاري تحميل التحديث يرجي الانتظار : ${pr.value} %",
        )));


    await _dio.download(
      appPath,
      downloadedFilePath,
      onReceiveProgress: (received, total) {
          pr.value = "${((received / total) * 100).toInt()}";
          pr.refresh();
        update();
        // debugPrint('Rec: $received , Total: $total, $pr%');
        _downloadProgress.value = double.parse(pr.value);
      },
    );
    if (Platform.isWindows) {
      await openExeFile(downloadedFilePath);
    }

    _isDownloading.value = false;
    update();
  }

  Future<void> checkForUpdates() async {
    final jsonVal = await loadJsonFromGithub();
    debugPrint("Response: $jsonVal");
    if (jsonVal['version'] > currentVersion) {
      //delay for 3 seconds
      await Future.delayed(const Duration(seconds: 3));
      Get.offAll(() => const UpdateScreen());

      downloadNewVersion(jsonVal["windows_file_name"]);
    }
  }
}
