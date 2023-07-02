import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../controllers/quiz/question_month_controller.dart';
import '../../../responsive.dart';
import '../quiz_mobile/answer_quiz_month_view.dart';
import '../quiz_windows/answer_view_month_windows.dart';

class AnswerViewMonthCommon extends GetView<QuestionMonthController> {
  const AnswerViewMonthCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: AnswerQuizMonthView(), desktop: AnswerViewMonthWindows());
  }
}