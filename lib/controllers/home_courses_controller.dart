import 'package:edu_lens/model/courses_models/chapter_model.dart';
import 'package:edu_lens/model/courses_models/lecture_model.dart';
import 'package:edu_lens/services/get_chapter.dart';
import 'package:edu_lens/services/get_teacher_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  //
  // void animateToIndex(int index, int itemCount) {
  //   final ScrollController scrollController = ScrollController();
  //
  //   final contentSize = scrollController.position.viewportDimension + scrollController.position.maxScrollExtent;
  //   final index = 10;
  //   final target = contentSize * index / itemCount;
  //   scrollController.position.animateTo(
  //     target,
  //     duration: const Duration(seconds: 2),
  //     curve: Curves.easeInOut,
  //   );
  // }
 //    scrollController.position.axisDirection;
 // //   scrollController.createScrollPosition(AlwaysScrollableScrollPhysics(), context, oldPosition)
 //    scrollController.animateTo(
 //      index * 100,
 //      duration: const Duration(seconds: 2),
 //      curve: Curves.fastOutSlowIn,
 //    );
  //}
}
