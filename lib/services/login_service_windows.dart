import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/dio_integration.dart';
import 'package:edu_lens/view/widget/custom_dialog/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/cashe_helper.dart';
import '../model/user_model.dart';
import '../view/home/home_screen.dart';
class LoginWindowsService {
  final dio = DioUtilNew.dio;

  Future<void> loginWindows(BuildContext context, {String? password, String? phone, }) async {
    try {
      final response = await dio!.post(AppConstants.login, data: {
        "password": password,
        "phone": phone,
      });
      if (response.statusCode == 200) {
        UserModel userModel = UserModel.fromJson(response.data);
     //  CacheHelper.saveData(key: AppConstants.token, value: userModel.token);
        CacheHelper.saveData(
            key: AppConstants.studentId,
            value: userModel.student!.id);
        CacheHelper.saveData(
            key: AppConstants.studentClassId,
            value: userModel.student!.studentClassId);
        Get.offAllNamed('/home');
      } else if (response.statusCode == 400) {
        showCustomSnackBar(
            context: context,
            title: "note".tr,
            deck: response.data.toString().split(',')[0],
            contentType: ContentType.failure);
      }
    } catch (e) {

      debugPrint(e.toString());
    }
  }
}
