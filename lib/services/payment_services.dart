import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/controllers/payment_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/cashe_helper.dart';
import 'package:edu_lens/helper/dio_integration.dart';
import 'package:edu_lens/view/widget/custom_dialog/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentServices {
  final dio = DioUtilNew.dio;
  PaymentController paymentController = Get.put(PaymentController());

  Future<String> buyLectureByCoupon({
    required code,
    required lectureId,
    required teacherId,
    required context,
  }) async {
    // debugPrint("code : $code");
    // debugPrint("lecture_id : $lectureId");
    // debugPrint("teacher_id : $teacherId");
    // debugPrint("student_id : ${ CacheHelper.getData(
    //   key: AppConstants.studentId,
    // )}");
    // debugPrint("student_class_id : ${ CacheHelper.getData(
    //   key: AppConstants.studentClassId,
    // )}");
    try {
      final response =
          await dio!.post(AppConstants.activateCouponLecture, queryParameters: {
        "student_id": CacheHelper.getData(
          key: AppConstants.studentId,
        ),
        "student_class_id": CacheHelper.getData(
          key: AppConstants.studentClassId,
        ),
        "teacher_id": teacherId,
        "code": code,
        "lecture_id": lectureId,
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        HomeController homeController = Get.put(HomeController());
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: "تم شراء المحاضرة بنجاح 🫶",
            contentType: ContentType.success);
        await homeController.updateLecturePaid();
        Timer(const Duration(milliseconds: 1000), () {
          Get.back();
        });
      } else if (response.statusCode == 400) {
        debugPrint("else 400");
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: response.data.toString(),
            contentType: ContentType.warning);
      } else {
        debugPrint("else");
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: response.data.toString(),
            contentType: ContentType.warning);
      }
    } catch (e) {
      debugPrint("catch $e");

      debugPrint(e.toString());
      showCustomSnackBar(
          context: Get.context!,
          title: "note".tr,
          deck: e.toString(),
          contentType: ContentType.warning);
      return e.toString();
    }

    return "";
  }

  Future<String> buyLectureByBucket({
    required lectureId,
    required teacherId,
    context,
  }) async {
    try {
      // debugPrint("studentId ${CacheHelper.getData(
      //   key: AppConstants.studentId,
      // )}");
      final response =
          await dio!.post(AppConstants.buyThisLecture, queryParameters: {
        "lecture_id": lectureId,
        "student_id": CacheHelper.getData(
          key: AppConstants.studentId,
        ),
        "teacher_id": teacherId,
        "student_class_id": CacheHelper.getData(
          key: AppConstants.studentClassId,
        ),
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      // debugPrint(response.statusCode.toString());
      // debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        HomeController homeController = Get.put(HomeController());
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: "تم شراء المحاضرة بنجاح 🫶",
            contentType: ContentType.success);
        await homeController.updateLecturePaid();
        Timer(const Duration(milliseconds: 1000), () {
          Get.back();
        });
        // final mList = List<CoursesModel>.from(
        //     response.data.map((i) => CoursesModel.fromJson(i)));
        // debugPrint(mList.length.toString());
        //
        // return mList;
      } else if (response.statusCode == 400) {
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: response.data.toString(),
            contentType: ContentType.warning);
      } else {
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: response.data.toString(),
            contentType: ContentType.warning);
      }
    } catch (e) {
      debugPrint(e.toString());
      showCustomSnackBar(
          context: Get.context!,
          title: "note".tr,
          deck: e.toString(),
          contentType: ContentType.warning);
      return e.toString();
    }

    return "";
  }

  Future<String> buyChapterByBucket({
    required chapterId,
    required teacherId,
    context,
  }) async {
    try {
      debugPrint("studentId ${CacheHelper.getData(
        key: AppConstants.studentId,
      )}");
      final response =
          await dio!.post(AppConstants.buyThisChapter, queryParameters: {
        "chapter_id": chapterId,

        "student_id": CacheHelper.getData(
          key: AppConstants.studentId,
        ),

        "teacher_id": teacherId,
        "student_class_id": CacheHelper.getData(
          key: AppConstants.studentClassId,
        ),
        // "code": code,
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        HomeController homeController = Get.put(HomeController());
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: "تم شراء الفصل بنجاح 🫶",
            contentType: ContentType.success);
        await homeController.updateChapterPaid();
        Timer(const Duration(milliseconds: 1000), () {
          Get.back();
        });
        // final mList = List<CoursesModel>.from(
        //     response.data.map((i) => CoursesModel.fromJson(i)));
        // debugPrint(mList.length.toString());
        //
        // return mList;
      } else if (response.statusCode == 400) {
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: response.data.toString(),
            contentType: ContentType.warning);
      } else {
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: response.data.toString(),
            contentType: ContentType.warning);
      }
    } catch (e) {
      debugPrint(e.toString());
      showCustomSnackBar(
          context: Get.context!,
          title: "note".tr,
          deck: e.toString(),
          contentType: ContentType.warning);
      return e.toString();
    }

    return "";
  }

  Future<String> buyChapterByCoupon({
    required code,
    required chapterId,
    required teacherId,
    required context,
  }) async {
    try {
      // debugPrint("studentId ${CacheHelper.getData(
      //   key: AppConstants.studentId,
      // )}");
      debugPrint("code : $code");
      debugPrint("chapter_id : $chapterId");
      debugPrint("teacher_id : $teacherId");
      debugPrint("student_id : ${CacheHelper.getData(
        key: AppConstants.studentId,
      )}");
      debugPrint("student_class_id : ${CacheHelper.getData(
        key: AppConstants.studentClassId,
      )}");
      final response =
          await dio!.post(AppConstants.activateCouponChapter, queryParameters: {
        "chapter_id": chapterId,
        "student_id": CacheHelper.getData(
          key: AppConstants.studentId,
        ),
        "teacher_id": teacherId,
        "student_class_id": CacheHelper.getData(
          key: AppConstants.studentClassId,
        ),
        "code": code,
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        HomeController homeController = Get.put(HomeController());
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: "تم شراء الفصل بنجاح 🫶",
            contentType: ContentType.success);
        await homeController.updateChapterPaid();
        Timer(const Duration(milliseconds: 1000), () {
          Get.back();
        }); // final mList = List<CoursesModel>.from(
        //     response.data.map((i) => CoursesModel.fromJson(i)));
        // debugPrint(mList.length.toString());
        //
        // return mList;
      } else if (response.statusCode == 400) {
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: response.data.toString(),
            contentType: ContentType.warning);
      } else {
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: response.data.toString(),
            contentType: ContentType.warning);
      }
    } catch (e) {
      debugPrint(e.toString());
      showCustomSnackBar(
          context: Get.context!,
          title: "note".tr,
          deck: e.toString(),
          contentType: ContentType.warning);
      return e.toString();
    }

    return "";
  }

  Future<String> buyMonthExamByBucket({
    required int examId,
    required int teacherId,
    required context,
  }) async {
    try {
      final response =
          await dio!.post(AppConstants.buyExamByBucket, queryParameters: {
        "exam_id": examId,
        "student_id": CacheHelper.getData(
          key: AppConstants.studentId,
        ),
        "teacher_id": teacherId,
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        HomeController homeController = Get.put(HomeController());
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: "تم شراء الامتحان بنجاح 🫶",
            contentType: ContentType.success);
        await homeController.updateSolvedExams();
        Timer(const Duration(milliseconds: 1000), () {
          Get.back();
        });
      } else if (response.statusCode == 400) {
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: response.data.toString(),
            contentType: ContentType.warning);
      } else {
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: response.data.toString(),
            contentType: ContentType.warning);
      }
    } catch (e) {
      debugPrint(e.toString());
      showCustomSnackBar(
          context: Get.context!,
          title: "note".tr,
          deck: e.toString(),
          contentType: ContentType.warning);
      return e.toString();
    }

    return "";
  }

  Future<String> reserveByBucket({
    required var reservationId,
    required context,
  }) async {
    try {
      final response =
          await dio!.post(AppConstants.reserveCourse, queryParameters: {
        "student_id": CacheHelper.getData(
          key: AppConstants.studentId,
        ),
        "reservation_id": reservationId,
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        HomeController homeController = Get.put(HomeController());
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: "تم الحجز بنجاح",
            contentType: ContentType.success);
        await homeController.updateStudentReservations();
        Timer(const Duration(milliseconds: 1000), () {
          Get.back();
        });
      } else if (response.statusCode == 400) {
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: response.data.toString(),
            contentType: ContentType.warning);
      } else {
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: response.data.toString(),
            contentType: ContentType.warning);
      }
    } catch (e) {
      debugPrint(e.toString());
      showCustomSnackBar(
          context: Get.context!,
          title: "note".tr,
          deck: e.toString(),
          contentType: ContentType.warning);
      return e.toString();
    }

    return "";
  }

  Future<String> buyMonthExamByCoupon({
    required code,
    required monthExamId,
    required teacherId,
    required context,
  }) async {
    try {
      // debugPrint("studentId ${CacheHelper.getData(
      //   key: AppConstants.studentId,
      // )}");
      debugPrint("code : $code");
      debugPrint("monthExam_id : $monthExamId");
      debugPrint("teacher_id : $teacherId");
      debugPrint("student_id : ${CacheHelper.getData(
        key: AppConstants.studentId,
      )}");
      debugPrint("student_class_id : ${CacheHelper.getData(
        key: AppConstants.studentClassId,
      )}");
      final response =
          await dio!.post(AppConstants.activateCouponExam, queryParameters: {
        "exam_id": monthExamId,
        "student_id": CacheHelper.getData(
          key: AppConstants.studentId,
        ),
        "teacher_id": teacherId,
        "student_class_id": CacheHelper.getData(
          key: AppConstants.studentClassId,
        ),
        "code": code,
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        HomeController homeController = Get.put(HomeController());
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: "تم شراء الامتحان بنجاح 🫶",
            contentType: ContentType.success);
        await homeController.updateSolvedExams();
        Timer(const Duration(milliseconds: 1000), () {
          Get.back();
        });
      } else if (response.statusCode == 400) {
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: response.data.toString(),
            contentType: ContentType.warning);
      } else {
        showCustomSnackBar(
            context: Get.context!,
            title: "note".tr,
            deck: response.data.toString(),
            contentType: ContentType.warning);
      }
    } catch (e) {
      debugPrint(e.toString());
      showCustomSnackBar(
          context: Get.context!,
          title: "note".tr,
          deck: e.toString(),
          contentType: ContentType.warning);
      return e.toString();
    }

    return "";
  }
}
