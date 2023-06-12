import 'dart:async';
import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edu_lens/controllers/login/switch_login.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/cashe_helper.dart';
import 'package:edu_lens/helper/dio_integration.dart';
import 'package:edu_lens/model/city_model.dart';
import 'package:edu_lens/model/classes_model.dart';
import 'package:edu_lens/model/error_model.dart';
import 'package:edu_lens/model/gender_model.dart';
import 'package:edu_lens/model/register_model.dart';
import 'package:edu_lens/model/section_model.dart';
import 'package:edu_lens/model/sucess_model.dart';
import 'package:edu_lens/view/home/home.dart';
import 'package:edu_lens/view/login/mobile/login_view.dart';
import 'package:edu_lens/view/widget/custom_dialog/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterServices {
  final dio = DioUtilNew.dio;

  register(BuildContext context, RegisterModel registerModel) async {
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
        CacheHelper.saveData(
            key: AppConstants.token, value: response.data['token']);
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
          Get.offAll(() => SwitchLogin());
          // Get.offAll(() => token == null ? const LoginView() : Home());
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

// Future<List<CityModel>?> getCity() async {
//   try {
//     final response = await dio!.get(AppConstants.city);
//
//     debugPrint(response.statusCode.toString());
//     log(response.data.toString());
//     if (response.statusCode == 200) {
//       final mList = List<CityModel>.from(
//           response.data.map((i) => CityModel.fromJson(i)));
//       debugPrint(mList.length.toString());
//
//       return mList;
//     }
//   } catch (e) {
//     debugPrint(e.toString());
//   }
//   return null;
// }

// Future<List<SectionModel>?> getSections() async {
//   try {
//     final response = await dio!.get(AppConstants.sections);
//
//     debugPrint(response.statusCode.toString());
//     log(response.data.toString());
//     if (response.statusCode == 200) {
//       final mList = List<SectionModel>.from(
//           response.data.map((i) => SectionModel.fromJson(i)));
//       debugPrint(mList.length.toString());
//
//       return mList;
//     }
//   } catch (e) {
//     debugPrint(e.toString());
//   }
//   return null;
// }

// Future<List<GenderModel>?> getGenders() async {
//   try {
//     final response = await dio!.get(AppConstants.genders);
//
//     debugPrint(response.statusCode.toString());
//     debugPrint(response.data.toString());
//     if (response.statusCode == 200) {
//       final mList = List<GenderModel>.from(
//           response.data.map((i) => GenderModel.fromJson(i)));
//       debugPrint(mList.length.toString());
//
//       return mList;
//     }
//   } catch (e) {
//     debugPrint(e.toString());
//   }
//   return null;
// }

// Future<List<ClassesModel>?> getClasses() async {
//   try {
//     // final response = await dio!.get(AppConstants.classes);
//
//     // debugPrint(response.statusCode.toString());
//     // log(response.data.toString());
//     final list =[
//       ClassesModel(
//         id: 1,
//         name: "تعليم حر",
//         gradeId: 1,
//         createdAt: "2022-04-14T23:00:22.000000Z",
//         updatedAt: "2022-04-14T23:00:22.000000Z"
//       ),
//       ClassesModel(
//         id: 2,
//         name: "الفرقة الأولى",
//         gradeId: 2,
//         createdAt: "2022-04-14T23:00:22.000000Z",
//         updatedAt: "2022-04-14T23:00:22.000000Z"
//       ),
//       ClassesModel(
//         id: 3,
//         name: "الفرقة الثانية",
//         gradeId: 2,
//        createdAt: "2022-04-14T23:00:22.000000Z",
//        updatedAt: "2022-04-14T23:00:22.000000Z"
//       ),
//       ClassesModel(
//        id: 4,
//         name: "الفرقة الثالثة",
//         gradeId: 2,
//         createdAt: "2022-04-14T23:00:22.000000Z",
//         updatedAt: "2022-04-14T23:00:22.000000Z"
//       ),
//       ClassesModel(
//        id: 5,
//         name: "الفرقة الرابعة",
//         gradeId: 2,
//         createdAt: "2022-04-14T23:00:22.000000Z",
//         updatedAt: "2022-04-14T23:00:22.000000Z"
//       ),
//       ClassesModel(
//        id: 6,
//         name: "الفرقة الخامسة",
//         gradeId: 2,
//         createdAt: "2022-04-14T23:00:22.000000Z",
//         updatedAt: "2022-04-14T23:00:22.000000Z"
//       ),
//       ClassesModel(
//        id: 7,
//         name: "الفرقة السادسة",
//         gradeId: 2,
//         createdAt: "2022-04-14T23:00:22.000000Z",
//         updatedAt: "2022-04-14T23:00:22.000000Z"
//       ),
//       ClassesModel(
//        id: 8,
//         name: "الفرقة السابعة",
//         gradeId: 2,
//         createdAt: "2022-04-14T23:00:22.000000Z",
//         updatedAt: "2022-04-14T23:00:22.000000Z"
//       ),
//       ClassesModel(
//        id: 9,
//         name: "الصف الأول الإعدادي",
//         gradeId: 3,
//         createdAt: "2022-04-14T23:00:22.000000Z",
//         updatedAt: "2022-04-14T23:00:22.000000Z"
//       ),
//       ClassesModel(
//        id: 10,
//         name: "الصف الثاني الإعدادي",
//         gradeId: 3,
//         createdAt: "2022-04-14T23:00:22.000000Z",
//         updatedAt: "2022-04-14T23:00:22.000000Z"
//       ),
//       ClassesModel(
//        id: 11,
//         name: "الصف الثالث الإعدادي",
//         gradeId: 3,
//         createdAt: "2022-04-14T23:00:22.000000Z",
//         updatedAt: "2022-04-14T23:00:22.000000Z"
//       ),
//       ClassesModel(
//        id: 12,
//         name: "الصف الأول الثانوي",
//         gradeId: 3,
//         createdAt: "2022-04-14T23:00:22.000000Z",
//         updatedAt: "2022-04-14T23:00:22.000000Z"
//       ),
//       ClassesModel(
//        id: 13,
//         name: "الصف الثاني الثانوي",
//         gradeId: 3,
//         createdAt: "2022-04-14T23:00:22.000000Z",
//         updatedAt: "2022-04-14T23:00:22.000000Z"
//       ),
//       ClassesModel(
//        id: 14,
//         name: "الصف الثالث الثانوي",
//         gradeId: 3,
//         createdAt: "2022-04-14T23:00:22.000000Z",
//         updatedAt: "2022-04-14T23:00:22.000000Z"
//       )
//     ];
//     // final list =[
//     //   {
//     //     "id": 1,
//     //     "name": "تعليم حر",
//     //     "grade_id": 1,
//     //     "created_at": "2022-04-14T23:00:22.000000Z",
//     //     "updated_at": "2022-04-14T23:00:22.000000Z"
//     //   },
//     //   {
//     //     "id": 2,
//     //     "name": "الفرقة الأولى",
//     //     'grade_id': 2,
//     //     "created_at": "2022-04-14T23:00:22.000000Z",
//     //     "updated_at": "2022-04-14T23:00:22.000000Z"
//     //   },
//     //   {
//     //     "id": 3,
//     //     "name": "الفرقة الثانية",
//     //     "grade_id": 2,
//     //    "created_at": "2022-04-14T23:00:22.000000Z",
//     //    "updated_at": "2022-04-14T23:00:22.000000Z"
//     //   },
//     //   {
//     //    "id": 4,
//     //     "name": "الفرقة الثالثة",
//     //     "grade_id": 2,
//     //     "created_at": "2022-04-14T23:00:22.000000Z",
//     //     "updated_at": "2022-04-14T23:00:22.000000Z"
//     //   },
//     //   {
//     //    "id": 5,
//     //     "name": "الفرقة الرابعة",
//     //     "grade_id": 2,
//     //     "created_at": "2022-04-14T23:00:22.000000Z",
//     //     "updated_at": "2022-04-14T23:00:22.000000Z"
//     //   },
//     //   {
//     //    "id": 6,
//     //     "name": "الفرقة الخامسة",
//     //     "grade_id": 2,
//     //     "created_at": "2022-04-14T23:00:22.000000Z",
//     //     "updated_at": "2022-04-14T23:00:22.000000Z"
//     //   },
//     //   {
//     //    "id": 7,
//     //     "name": "الفرقة السادسة",
//     //     "grade_id": 2,
//     //     "created_at": "2022-04-14T23:00:22.000000Z",
//     //     "updated_at": "2022-04-14T23:00:22.000000Z"
//     //   },
//     //   {
//     //    "id": 8,
//     //     "name": "الفرقة السابعة",
//     //     "grade_id": 2,
//     //     "created_at": "2022-04-14T23:00:22.000000Z",
//     //     "updated_at": "2022-04-14T23:00:22.000000Z"
//     //   },
//     //   {
//     //    "id": 9,
//     //     "name": "الصف الأول الإعدادي",
//     //     "grade_id": 3,
//     //     "created_at": "2022-04-14T23:00:22.000000Z",
//     //     "updated_at": "2022-04-14T23:00:22.000000Z"
//     //   },
//     //   {
//     //    "id": 10,
//     //     "name": "الصف الثاني الإعدادي",
//     //     "grade_id": 3,
//     //     "created_at": "2022-04-14T23:00:22.000000Z",
//     //     "updated_at": "2022-04-14T23:00:22.000000Z"
//     //   },
//     //   {
//     //    "id": 11,
//     //     "name": "الصف الثالث الإعدادي",
//     //     "grade_id": 3,
//     //     "created_at": "2022-04-14T23:00:22.000000Z",
//     //     "updated_at": "2022-04-14T23:00:22.000000Z"
//     //   },
//     //   {
//     //    "id": 12,
//     //     "name": "الصف الأول الثانوي",
//     //     "grade_id": 3,
//     //     "created_at": "2022-04-14T23:00:22.000000Z",
//     //     "updated_at": "2022-04-14T23:00:22.000000Z"
//     //   },
//     //   {
//     //    "id": 13,
//     //     "name": "الصف الثاني الثانوي",
//     //     "grade_id": 3,
//     //     "created_at": "2022-04-14T23:00:22.000000Z",
//     //     "updated_at": "2022-04-14T23:00:22.000000Z"
//     //   },
//     //   {
//     //    "id": 14,
//     //     "name": "الصف الثالث الثانوي",
//     //     "grade_id": 3,
//     //     "created_at": "2022-04-14T23:00:22.000000Z",
//     //     "updated_at": "2022-04-14T23:00:22.000000Z"
//     //   }
//     // ];
//     // if (response.statusCode == 200) {
//       final mList = List<ClassesModel>.from(
//           list.map((i) => ClassesModel.fromJson(i)));
//       debugPrint(mList.length.toString());
//       return mList;
//     // }
//   } catch (e) {
//     debugPrint(e.toString());
//   }
//   return null;
// }

