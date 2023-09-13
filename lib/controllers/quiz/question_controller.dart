import 'dart:async';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/controllers/video_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/routes/routes_names.dart';
import 'package:edu_lens/view/quiz/quiz_mobile/answer_quiz_view.dart';
import 'package:edu_lens/view/widget/custom_dialog/snackBar.dart';
import 'package:edu_lens/view/widget/custom_loading.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_protector/screen_protector.dart';

class QuestionController extends GetxController {
  HomeController homeController = Get.put(HomeController());
  VideoController videoController = Get.put(VideoController());
  int finalDegree = 0;
  double? screenWidth = 0.0, screenHeight = 0.0;
RxBool endTimerBool=false.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    await ScreenProtector.preventScreenshotOff();

  }
  @override

  Future<void> onClose() async {
    super.onClose();
    await ScreenProtector.preventScreenshotOn();

  }

  checkTheQuestionAnswer({context, controller, questionList}) {
    if (!kDebugMode) {
      for (int i = 0; i < questionList.length; i++) {
        if (questionList[i].answer == null) {
          debugPrint((i + 1).toString());
          controller.animateToPage(i);

          return showCustomSnackBar(
              context: Get.context!,
              title: "note".tr,
              deck: "لم تقم بحل هذا السوال",
              contentType: ContentType.warning);
        }
      }
    }
    return getFinalDegreeAndEndExam(questionList: questionList);
  }

  getFinalDegreeAndEndExam({questionList}) async {
    Get.dialog(CustomLoading());
    finalDegree = 0;
    for (var element in questionList) {
      for (var element2 in element.choices!) {
        if (element2.isCorrect == 1 && element2.choice == element.answer) {
          finalDegree++;
        }
      }
    }

    final result = await videoController.endExam(degree: finalDegree);
    if (result == 200) {
      Get.back();
      return openBottomSheet(questionList: questionList);
    }
    Get.back();
    return null;
  }

  void openBottomSheet({questionList}) {
    Get.bottomSheet(
      WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: Column(
          children: [
            const SizedBox(height: 20),
            Column(
              children: [
                CustomText(
                  text: "numberOfQuestion".tr,
                  color: Colors.black,
                  fontSize: 25,
                  widthContainer: screenWidth! * 0.70,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomText(
                  text: "${questionList.length}",
                  fontSize: 30,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    CustomText(
                      text: "numberOfCorrectAnswers".tr,
                      color: Colors.green.shade500,
                      fontSize: 25,
                      widthContainer: screenWidth! * 0.45,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text: "$finalDegree",
                      fontSize: 20,
                    ),
                  ],
                )),
                Container(
                  width: 2,
                  height: 60,
                  color: AppConstants.primaryColor,
                ),
                Expanded(
                    child: Column(
                  children: [
                    CustomText(
                      text: "numberOfWrongAnswers".tr,
                      color: Colors.red.shade500,
                      fontSize: 25,
                      widthContainer: screenWidth! * 0.45,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text: "${questionList.length - finalDegree}",
                      fontSize: 20,
                    ),
                  ],
                )),
              ],
            ),
            const SizedBox(
              height: 18,
            ),

            InkWell(
              onTap: () async {
                Get.dialog(CustomLoading());
                await homeController.updateSolvedExams();
                Get.back();
                Get.toNamed(RoutesNames.answerQuizView, arguments:  {
                  'questionList':  questionList,
                });
              },
              child: Container(
                  width: 300,
                  padding: const EdgeInsets.only(
                      top: 9, bottom: 9, right: 7, left: 7),
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: AppConstants.primaryColor,
                    border: Border.all(
                        color: AppConstants.primaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Center(
                      child: CustomText(
                    text: "showModelAnswer".tr,
                    fontSize: 18,
                    textDirection: TextDirection.ltr,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ))),
            ),
            // InkWell(
            //   onTap: () {
            //     Get.off(() => QuestionView());
            //   },
            //   child: Container(
            //       width: 300,
            //       padding: const EdgeInsets.only(
            //           top: 9, bottom: 9, right: 7, left: 7),
            //       margin: const EdgeInsets.only(top: 20),
            //       decoration: BoxDecoration(
            //         color: AppConstants.primaryColor,
            //         border: Border.all(
            //             color: AppConstants.primaryColor, width: 2.0),
            //         borderRadius: BorderRadius.circular(30.0),
            //       ),
            //       child: Center(
            //           child: CustomText(
            //         text: "tryAgain".tr,
            //         fontSize: 18,
            //         textDirection: TextDirection.ltr,
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //       ))),
            // ),
            const SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () async {
                Get.back();
                Get.back();
                await ScreenProtector.preventScreenshotOn();
              },
              child: Container(
                  width: 300,
                  padding: const EdgeInsets.only(
                      top: 9, bottom: 9, right: 7, left: 7),
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: AppConstants.primaryColor,
                    border: Border.all(
                        color: AppConstants.primaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Center(
                      child: CustomText(
                    text: "bakeToVideo".tr,
                    fontSize: 18,
                    textDirection: TextDirection.ltr,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ))),
            ),
          ],
        ),
      ),
      enableDrag: true,
      backgroundColor: Colors.white,
      elevation: 0,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
    );
  }
}
