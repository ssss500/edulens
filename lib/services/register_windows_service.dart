import 'dart:async';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/cashe_helper.dart';
import 'package:edu_lens/helper/dio_integration.dart';
import 'package:edu_lens/model/error_model.dart';
import 'package:edu_lens/model/register_model.dart';
import 'package:edu_lens/routes/routes_names.dart';
import 'package:edu_lens/view/widget/custom_dialog/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterWindowsServices {
  final dio = DioUtilNew.dio;

  registerForWindowsService(BuildContext context, RegisterModel registerModel) async {
    debugPrint(
        "registerModel.toJson().toString() : ${registerModel.toJson().toString()}");
    try {
      final response =
      await dio!.post(AppConstants.register, data: registerModel.toJson());
      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());
      debugPrint("1");
      if (response.statusCode == 200) {
        debugPrint("2--");
        // CacheHelper.saveData(
        //     key: AppConstants.token, value: response.data['token']);
        CacheHelper.saveData(
            key: AppConstants.studentId, value: response.data['student']['id']);
        CacheHelper.saveData(
            key: AppConstants.studentClassId,
            value: response.data['student']['student_class_id']);
        debugPrint("done");
        showCustomSnackBar(
            context: context,
            title: "note".tr,
            deck: "تم انشاء الحساب بنجاح",
            contentType: ContentType.success);
        Timer(const Duration(milliseconds: 1000), () {
          Get.offAllNamed(RoutesNames.home);
           //Get.offAll(() => token == null ? const LoginView() : Home());
        });
      } else if (response.statusCode == 422) {
        debugPrint("4--");

        debugPrint("response.data : 37 ${response.data}");
        ErrorModel errorModel = ErrorModel.fromJson(response.data);

        showCustomSnackBar(
            context: context,
            title: "note".tr,
            deck:
            "${errorModel.errors!.email!.isNotEmpty ? "${errorModel.errors!.email![0]}, " : ""} ${errorModel.errors!.phone!.isNotEmpty ? "${errorModel.errors!.phone![0]}, " : ""} ${errorModel.errors!.birthday!.isNotEmpty ? "${errorModel.errors!.birthday![0]}, " : ""}",
            contentType: ContentType.failure);
      }else{
        showCustomSnackBar(
            context: context,
            title: "note".tr,
            deck:
            "${response.statusCode} : ${response.data}",
            contentType: ContentType.failure);
      }
    } catch (e) {
      showCustomSnackBar(
          context: context,
          title: "note".tr,
          deck: "حدث خطاء يرجي المحاوله مره اخري ${e.toString()}",
          contentType: ContentType.failure);
      debugPrint(e.toString());
      debugPrint("catch : 5--");
    }
  }}