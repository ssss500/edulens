import 'package:edu_lens/controllers/home_courses_controller.dart';
import 'package:edu_lens/controllers/video_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/cashe_helper.dart';
import 'package:edu_lens/helper/dio_integration.dart';
import 'package:edu_lens/model/courses_models/pdf_model.dart';
import 'package:edu_lens/model/courses_models/question_model.dart';
import 'package:edu_lens/model/courses_models/quiz_model.dart';
import 'package:edu_lens/model/lecture_paid_model.dart';
import 'package:edu_lens/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetVideoExtensions {
  final dio = DioUtilNew.dio;

  Future<List<PdfModel>?> getPDF() async {
    HomeCoursesController homeCoursesController =
        Get.put(HomeCoursesController());
    debugPrint(homeCoursesController
        .chapters[homeCoursesController.indexChapters]
        .lectures![homeCoursesController.indexLectures]
        .id
        .toString());
    try {
      final response =
          await dio!.post(AppConstants.lectureBooks, queryParameters: {
        "lecture_id": homeCoursesController
            .chapters[homeCoursesController.indexChapters]
            .lectures![homeCoursesController.indexLectures]
            .id
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        final mList =
            List<PdfModel>.from(response.data.map((i) => PdfModel.fromJson(i)));
        debugPrint(mList.length.toString());
        mList.removeWhere((element) => element.status == 0);

        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<PdfModel>?> getPDFPayed(
      {required LecturePaidModel lecturePaidModel}) async {
    try {
      final response = await dio!.post(AppConstants.lectureBooks,
          queryParameters: {"lecture_id": lecturePaidModel.id},
          data: {"api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"});

      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        final mList =
            List<PdfModel>.from(response.data.map((i) => PdfModel.fromJson(i)));
        debugPrint(mList.length.toString());
        mList.removeWhere((element) => element.status == 0);

        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<QuizModel>?> getQuiz() async {
    HomeCoursesController homeCoursesController =
        Get.put(HomeCoursesController());
    try {
      final response =
          await dio!.post(AppConstants.lectureExams, queryParameters: {
        "lecture_id": homeCoursesController
            .chapters[homeCoursesController.indexChapters]
            .lectures![homeCoursesController.indexLectures]
            .id
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        final mList = List<QuizModel>.from(
            response.data.map((i) => QuizModel.fromJson(i)));
        debugPrint(mList.length.toString());
        // mList.removeWhere((element) => element.status == 0);

        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<QuizModel>?> getQuizPayed(
      {required LecturePaidModel lecturePaidModel}) async {
    try {
      final response = await dio!.post(AppConstants.lectureExams,
          queryParameters: {"lecture_id": lecturePaidModel.id},
          data: {"api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"});

      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        final mList = List<QuizModel>.from(
            response.data.map((i) => QuizModel.fromJson(i)));
        debugPrint(mList.length.toString());
        // mList.removeWhere((element) => element.status == 0);

        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<QuestionModel>?> getQuestion({required idQuiz}) async {
    debugPrint("idQuiz : ${idQuiz.toString()}");
    try {
      final response = await dio!.post(AppConstants.customExamQuestion,
          queryParameters: {"exam_id": idQuiz},
          data: {"api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"});

      debugPrint("statusCode : ${response.statusCode}");
      debugPrint("response.data:  ${response.data}");
      if (response.statusCode == 200) {
        final mList = List<QuestionModel>.from(
            response.data.map((i) => QuestionModel.fromJson(i)));
        debugPrint("mList.length : ${mList.length}");

        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future startExam({
    required examId,
  }) async {
    try {
      final response =
          await dio!.post(AppConstants.startExam, queryParameters: {
        "exam_id": examId,
        "student_id": CacheHelper.getData(
          key: AppConstants.studentId,
        ),
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());
      // if (response.statusCode == 200) {
      //   final mList = List<QuizModel>.from(
      //       response.data.map((i) => QuizModel.fromJson(i)));
      //   print(mList.length);
      //
      //   return mList;
      // }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  endExam({required int examId, required degree}) async {
    try {
      final response = await dio!.post(AppConstants.endExam, queryParameters: {
        "exam_id": examId,
        "student_id": CacheHelper.getData(
          key: AppConstants.studentId,
        ),
        "degree": degree,
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      debugPrint(response.statusCode.toString());
      debugPrint("response.data : ${response.data}");
      return response.statusCode;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
