import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controllers/profile_teacher_controller.dart';
import '../../../responsive.dart';
import '../mobile/home_menu_mobile.dart';
import '../mobile/subject_teacher_view.dart';
import '../windows/teacher_profile.dart';

class TeacherProfileCommon extends GetView<ProfileTeacherController> {
  const TeacherProfileCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(mobile: SubjectTeacher(), desktop: TeacherProfile());
  }
}
