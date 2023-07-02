import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../controllers/subject_teacher_controller.dart';
import '../../../responsive.dart';
import '../mobile/subject_teacher_view.dart';
import '../windows/subject_teacher_screen_windows.dart';

class SubjectTeacherCommon extends GetView<SubjectTeacherController> {
  const SubjectTeacherCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: SubjectTeacher(), desktop: SubjectTeacherScreen());
  }
}
