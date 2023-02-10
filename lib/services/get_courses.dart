import 'dart:developer';

import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/cashe_helper.dart';
import 'package:edu_lens/helper/dio_integration.dart';
import 'package:edu_lens/model/profile_teacher_models/booking_model.dart';
import 'package:edu_lens/model/profile_teacher_models/courses_model.dart';
import 'package:edu_lens/model/profile_teacher_models/month_exam_model.dart';
import 'package:flutter/material.dart';

class GetCourses {
  final dio = DioUtilNew.dio;

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

  Future<List<MonthExamModel>?> getTeacherMonthExams({id}) async {
    try {
      debugPrint("id teacher $id");
      debugPrint("student class id  ${CacheHelper.getData(
        key: AppConstants.studentClassId,
      )}");
      final response =
          await dio!.post(AppConstants.customMonthExam, queryParameters: {
        "student_class_id": await CacheHelper.getData(
          key: AppConstants.studentClassId,
        ),
        "teacher_id": id,
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      debugPrint(response.statusCode.toString());
      log(response.data.toString());
      if (response.statusCode == 200) {
        List<MonthExamModel> mList =
            List<MonthExamModel>.from(response.data.map((i) =>
          MonthExamModel.fromJson(i)
        ));
        debugPrint(mList.length.toString());
        log(mList.toString());
        mList.removeWhere((element) => element.status == 0);
        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<BookingModel>?> getTeacherBookings({id}) async {
    try {
      debugPrint("id teacher $id");
      final response =
          await dio!.post(AppConstants.customBooking, queryParameters: {
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
        final mList = List<BookingModel>.from(
            response.data.map((i) => BookingModel.fromJson(i)));
        debugPrint(mList.length.toString());

        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
