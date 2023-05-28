import 'dart:developer';

import 'package:dio/src/response.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/cashe_helper.dart';
import 'package:edu_lens/helper/dio_integration.dart';
import 'package:edu_lens/model/chapter_paid_model.dart';
import 'package:edu_lens/model/classes_model.dart';
import 'package:edu_lens/model/courses_models/solved_exams_model.dart';
import 'package:edu_lens/model/cover_model.dart';
import 'package:edu_lens/model/lecture_paid_model.dart';
import 'package:edu_lens/model/student_reservations_model.dart';
import 'package:edu_lens/model/subject_model.dart';
import 'package:edu_lens/model/teacher_model.dart';
import 'package:edu_lens/model/user_model.dart';
import 'package:edu_lens/view/login/home_login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetHomeServices {
  final dio = DioUtilNew.dio;

  Future<List<TeacherModel>?> getTeacherList() async {
    debugPrint("studentId : ${CacheHelper.getData(
      key: AppConstants.studentId,
    )}");
    try {
      final response = await dio!.post(AppConstants.teachers, queryParameters: {
        "student_class_id": CacheHelper.getData(
          key: AppConstants.studentClassId,
        )
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      // debugPrint(response.statusCode);
      // debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        final mList = List<TeacherModel>.from(
            response.data.map((i) => TeacherModel.fromJson(i)));
        // print(mList.length);

        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<CoverModel>?> getCovers() async {
    debugPrint("studentId : ${CacheHelper.getData(
      key: AppConstants.studentId,
    )}");
    try {
      final response = await dio!.post(AppConstants.covers, queryParameters: {
        "student_class_id": CacheHelper.getData(
          key: AppConstants.studentClassId,
        )
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      // print(response.statusCode);
      // print(response.data);
      if (response.statusCode == 200) {
        final mList = List<CoverModel>.from(
            response.data.map((i) => CoverModel.fromJson(i)));
        // print(mList.length);

        log(mList.toString());
        mList.removeWhere((element) => element.status == 0);
        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<SubjectModel>?> getSubjectList() async {
    try {
      final response = await dio!.post(AppConstants.subject, queryParameters: {
        "student_class_id": CacheHelper.getData(
          key: AppConstants.studentClassId,
        )
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      // print(response.statusCode);
      // print(response.data);
      if (response.statusCode == 200) {
        final mList = List<SubjectModel>.from(
            response.data.map((i) => SubjectModel.fromJson(i)));
        // print(mList.length);

        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<StudentModel>?> getDataUser() async {
    try {
      debugPrint("AppConstants.studentId : ${CacheHelper.getData(
        key: AppConstants.studentId,
      )}");
      final response =
          await dio!.post(AppConstants.studentsData, queryParameters: {
        "id": CacheHelper.getData(
          key: AppConstants.studentId,
        )
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      if (response.statusCode == 200) {
        final mList = List<StudentModel>.from(
            response.data.map((i) => StudentModel.fromJson(i)));
        debugPrint("response user data : ${mList.length.toString()}");
        if(mList.isEmpty){
          GetStorage().remove("listTeacherLoves");
          await CacheHelper.clearData();
          Get.offAll(() =>  HomeLogin());
        }
        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  // Future<List<ClassesModel>?> getYears() async {
  //   try {
  //     late var response;
  //     response = await dio!.get(
  //       AppConstants.classes,
  //     );
  //     if (response.statusCode == 200) {
  //       log("get Years: ${response.data} ");
  //       final mList = List<ClassesModel>.from(
  //           response.data.map((i) => ClassesModel.fromJson(i)));
  //       return mList;
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  //   return null;
  // }

  Future<List<SolvedExamsModel>?> getSolvedExams() async {
    try {

     final response = await dio!.post(AppConstants.studentExams, queryParameters: {
        "student_id": CacheHelper.getData(
          key: AppConstants.studentId,
        )
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });
      if (response.statusCode == 200) {
        // log("response exam: ${response.data} ");
        final mList = List<SolvedExamsModel>.from(
            response.data.map((i) => SolvedExamsModel.fromJson(i)));
        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future getLecturePaid() async {
    try {

    final  response = await dio!.post(AppConstants.studentLecture, queryParameters: {
        "student_id": CacheHelper.getData(
          key: AppConstants.studentId,
        )
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });
      if (response.statusCode == 200) {
        debugPrint("response Lecture: ${response.data[0]} ");
        var mList;
       try {
          mList = List<LecturePaidModel>.from(
              response.data.map((i) => LecturePaidModel.fromJson(i)));
        }catch(e){
         mList=[];
         debugPrint("catch : 186${e.toString()}");
       }
        debugPrint("response Lecture done");

        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<ChapterPaidModel>?> getChapterPaid() async {
    try {
      late var response;
      response = await dio!.post(AppConstants.studentChapter, queryParameters: {
        "student_id": CacheHelper.getData(
          key: AppConstants.studentId,
        )
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });
      if (response.statusCode == 200) {
        log("Chapter Lecture: ${response.data} ");
        final mList = List<ChapterPaidModel>.from(
            response.data.map((i) => ChapterPaidModel.fromJson(i)));
        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<StudentReservationsModel>?> getReservations() async {
    try {
      late var response;
      response =
          await dio!.post(AppConstants.studentReservations, queryParameters: {
        "student_id": CacheHelper.getData(
          key: AppConstants.studentId,
        )
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });
      if (response.statusCode == 200) {
        log("Student Reservations: ${response.data} ");
        final mList = List<StudentReservationsModel>.from(
            response.data.map((i) => StudentReservationsModel.fromJson(i)));
        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
