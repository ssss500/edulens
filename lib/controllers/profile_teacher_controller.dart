import 'package:edu_lens/controllers/quiz/question_month_controller.dart';
import 'package:edu_lens/model/profile_teacher_models/booking_model.dart';
import 'package:edu_lens/model/profile_teacher_models/courses_model.dart';
import 'package:edu_lens/model/profile_teacher_models/month_exam_model.dart';
import 'package:edu_lens/model/teacher_model.dart';
import 'package:edu_lens/services/get_courses.dart';
import 'package:edu_lens/view/quiz/quiz_mobile/question_month_view.dart';
import 'package:edu_lens/view/widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes_names.dart';

class ProfileTeacherController extends GetxController {
  final services = GetCourses();
  final coursesTeacher = <CoursesModel>[].obs;
  final monthExamTeacher = <MonthExamModel>[].obs;
  final bookingTeacher = <BookingModel>[].obs;
  late int index;
  var dateTeacher;

  RxBool loadingCoursesTeacher=true.obs;

  // String? image;
  // String? name;
  // String? bio;
  // String? SubjectTeacher;
  // String? facebook;
  // String? youtube;
  // String? whatsapp;
  // @override
  // Future<void> onInit() async {
  //   // TODO: implement onInit
  //   super.onInit();
  // }
  cleanData() {
    coursesTeacher.value = [];
    monthExamTeacher.value = [];
    bookingTeacher.value = [];
    dateTeacher = null;
    debugPrint("clean data");
  }

  getCoursesAndExamAndBookings() async {
    loadingCoursesTeacher.value=true;
    coursesTeacher.value =
        (await services.getTeacherCourses(id: dateTeacher.id))!;
    loadingCoursesTeacher.value=false;

    monthExamTeacher.value =
        (await services.getTeacherMonthExams(id: dateTeacher.id))!;
    bookingTeacher.value =
        (await services.getTeacherBookings(id: dateTeacher.id))!;
  }
  goToQuiz(index) async {
      QuestionMonthController questionMonthController =
    Get.put(QuestionMonthController());
    Get.dialog(CustomLoading());
    questionMonthController
        .idQuiz =

        monthExamTeacher[
    index]
        .id!;
    questionMonthController
        .indexQuiz = index;
    questionMonthController
        .duraction =
         monthExamTeacher[
        index]
            .duration;
    await questionMonthController
        .getQuestions();
    Get.back();
    Get.toNamed(RoutesNames.qMonthView);

  }

}
