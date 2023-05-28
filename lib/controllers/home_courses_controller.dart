import 'package:edu_lens/model/courses_models/chapter_model.dart';
import 'package:edu_lens/model/courses_models/lecture_model.dart';
import 'package:edu_lens/services/get_chapter.dart';
import 'package:edu_lens/services/get_teacher_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';

class HomeCoursesController extends GetxController {
  final services = GetChapter();
  int indexLectures = 0;
  int indexChapters = 0;
  final chapters = <ChapterModel>[].obs;

  var chapterId=0;
  // final lectures = <LectureModel>[].obs;

  // late BetterPlayerController betterPlayerController;


  getChapters( ) async {
    chapters.value = (await services.getChapter(id: chapterId))!;
    // lectures.value = (await services.getLectures())!;
  }
}
