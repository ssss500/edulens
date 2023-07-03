import 'package:edu_lens/controllers/quiz/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../responsive.dart';
import '../quiz_mobile/answer_quiz_view.dart';
import '../quiz_windows/answer_view_windows.dart';


class SubjectTeacherCommon extends GetView<QuestionController> {
  const SubjectTeacherCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: AnswerQuizView(), desktop: AnswerViewWindows());
  }
}