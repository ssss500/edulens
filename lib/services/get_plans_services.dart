import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/controllers/package_controller.dart';
import 'package:edu_lens/controllers/subject_teacher_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/cashe_helper.dart';
import 'package:edu_lens/helper/dio_integration.dart';
import 'package:edu_lens/model/courses_models/chapter_model.dart';
import 'package:edu_lens/model/plan_model.dart';
import 'package:edu_lens/model/profile_teacher_models/courses_model.dart';
import 'package:edu_lens/model/teacher_model.dart';
import 'package:edu_lens/view/widget/custom_dialog/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetPlansServices {
  final dio = DioUtilNew.dio;
  num? idChapter = 0;

  Future<List<CoursesModel>?> getTeacherCourses({id}) async {
    try {
      debugPrint("id teacher $id");
      debugPrint("studentId ${CacheHelper.getData(
        key: AppConstants.studentId,
      )}");
      final response =
          await dio!.post(AppConstants.customCourses, queryParameters: {
        "student_class_id": CacheHelper.getData(
          key: AppConstants.studentClassId,
        ),
        "teacher_id": id,
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        final mList = List<CoursesModel>.from(
            response.data.map((i) => CoursesModel.fromJson(i)));
        debugPrint(mList.length.toString());

        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<ChapterModel>?> getChapter({id}) async {
    try {
      debugPrint("id teacher $id");
      final response =
          await dio!.post(AppConstants.customChapters, queryParameters: {
        "course_id": id,
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      debugPrint("statusCode : ${response.statusCode.toString()}");
      // log(response.data.toString());
      if (response.statusCode == 200) {
        final mList = List<ChapterModel>.from(
            response.data.map((i) => ChapterModel.fromJson(i)));
        idChapter = mList[0].id;

        ///   لكل شابتر هتجيب اللكتشر بتاعه Lectures

        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<PlanModel>?> getPlans() async {
    try {
      final response =
          await dio!.post(AppConstants.classPlan, queryParameters: {
        "class_id": CacheHelper.getData(
          key: AppConstants.studentClassId,
        )
        // "class_id": 12
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });
      if (response.statusCode == 200) {
        final mList = List<PlanModel>.from(
            response.data.map((i) => PlanModel.fromJson(i)));
        debugPrint(mList.length.toString());

        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<TeacherModel>?> getSubjectTeacher() async {
    PackageController packageController = Get.put(PackageController());

    try {
      final response = await dio!.post(AppConstants.subjectTeacher,
          queryParameters: {"subject_id": packageController.subjectId.value},
          data: {"api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"});
      if (response.statusCode == 200) {
        final mList = List<TeacherModel>.from(
            response.data[0].map((i) => TeacherModel.fromJson(i)));
        debugPrint(mList.length.toString());

        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List?> puyChapter() async {
    PackageController packageController = Get.put(PackageController());
    HomeController homeController = Get.put(HomeController());

    try {
      final response = await dio!.post(AppConstants.subjectTeacher,
          queryParameters: {
        "subject_id": packageController.subjectId.value,
        "plan_id": packageController.selectedPackage.id,
        "chapter_id": packageController.checkList,
          },
          data: {"api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"});
      if (response.statusCode == 200) {
        // final mList = List<TeacherModel>.from(
        //     response.data[0].map((i) => TeacherModel.fromJson(i)));
        // debugPrint(mLis.length.toString());
        log(response.data.toString());
        homeController.updateChapterPaid();
        showCustomSnackBar(
            context: Get.context,
            title: "note".tr,
            deck: "تم شراء الخطة بنجاح",
            contentType: ContentType.success);
        packageController.checkList.value=[];
        return null;
      }else{
        showCustomSnackBar(
            context: Get.context,
            title: "note".tr,
            deck: "${response.data}",
            contentType: ContentType.success);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
