import 'package:edu_lens/controllers/subject_teacher_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/dio_integration.dart';
import 'package:edu_lens/model/teacher_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetSubjectTeacherServices {
  final dio = DioUtilNew.dio;


  Future<List<TeacherModel>?> getSubjectTeacher() async {
    SubjectTeacherController subjectTeacherController =
    Get.put(SubjectTeacherController());
    try {
      final response = await dio!.post(AppConstants.subjectTeacher,
          queryParameters: {"subject_id": subjectTeacherController.subjectId},
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
}
