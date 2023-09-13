import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../controllers/subject_teacher_controller.dart';
import '../../../responsive.dart';
import '../../home_courses_view.dart';
import '../mobile/subject_teacher_view.dart';
import '../windows/courses_view_windows.dart';
import '../windows/subject_teacher_screen_windows.dart';

class CoursesCommon extends GetView<SubjectTeacherController> {
  const CoursesCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Responsive(
        mobile: HomeCoursesView(), desktop: CoursesViewWindows());
  }
}
