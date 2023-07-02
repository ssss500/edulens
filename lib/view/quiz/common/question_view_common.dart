import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../controllers/quiz/question_controller.dart';
import 'package:flutter/material.dart';
import '../../../controllers/quiz/question_month_controller.dart';
import '../../../responsive.dart';
import '../quiz_mobile/question_month_view.dart';
import '../quiz_mobile/question_view.dart';
import '../quiz_windows/question_view_month_windows.dart';

class QuestionViewCommon extends GetView<QuestionMonthController> {
  const QuestionViewCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Responsive(
        mobile: QuestionMonthView(), desktop: QuestionViewMonthWindows());
  }
}
