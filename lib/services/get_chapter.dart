import 'dart:developer';

import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/cashe_helper.dart';
import 'package:edu_lens/helper/dio_integration.dart';
import 'package:edu_lens/model/courses_models/chapter_model.dart';
import 'package:edu_lens/model/courses_models/lecture_model.dart';
import 'package:flutter/material.dart';

class GetChapter {
  final dio = DioUtilNew.dio;
  num? idChapter = 0;

  Future<List<ChapterModel>?> getChapter({id}) async {
    try {
      debugPrint("id chapter $id");
      final response =
          await dio!.post(AppConstants.customChapters, queryParameters: {
        "course_id": id,
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      // debugPrint("statusCode : ${response.statusCode.toString()}");
      // log(response.data[1].toString());
      if (response.statusCode == 200) {
        final mList = List<ChapterModel>.from(
            response.data.map((i) => ChapterModel.fromJson(i)));
        idChapter = mList[0].id;

        ///   لكل شابتر هتجيب اللكتشر بتاعه Lectures
        mList.removeWhere((element) => element.status == 0);

        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  // Future<List<LectureModel>?> getLectures() async {
  //   try {
  //     // debugPrint("id teacher $id");
  //     final response =
  //         await dio!.post(AppConstants.customLectures, queryParameters: {
  //       "chapter_id": idChapter,
  //     }, data: {
  //       "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
  //     });
  //
  //     print(response.statusCode);
  //     print(response.data);
  //     if (response.statusCode == 200) {
  //       final mList = List<LectureModel>.from(
  //           response.data.map((i) => LectureModel.fromJson(i)));
  //       print(mList.length);
  //
  //       ///   لكل شابتر هتجيب اللكتشر بتاعه Lectures
  //
  //       return mList;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return null;
  // }
}
