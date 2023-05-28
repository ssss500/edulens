import 'package:edu_lens/controllers/quiz/question_controller.dart';
import 'package:edu_lens/controllers/video_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/video/video_view.dart';
import 'package:edu_lens/view/widget/custom_app_bar.dart';
import 'package:edu_lens/view/widget/custom_image_url_view.dart';
import 'package:edu_lens/view/widget/custom_list_view.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_protector/screen_protector.dart';

class AnswerQuizView extends StatelessWidget {
  AnswerQuizView({Key? key,required this.questionList}) : super(key: key);

  QuestionController questionController = Get.put(QuestionController());
  var questionList;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        Get.back();
        await ScreenProtector.preventScreenshotOn();

        return Future.value(true);
      },
      child: CustomAppBar(
          backgroundImageBool: false,
          functionBake: () async {
            Get.back();

            Get.back();
            await ScreenProtector.preventScreenshotOn();

          },
          title: "نموذج حل الامتحان",
          widget: CustomListView(
              itemCount: questionList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppConstants.primaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(30),
                  ), //              height: 400,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0, right: 5, left: 5),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          //رقم السوال
                          CustomText(
                            text: "( ${index + 1} )",
                            fontSize: 30,
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          //الصوره
                          if (questionList[index].image != null)
                            CustomImageUrlView(
                              image:
                                  "https://edu-lens.com/images/questions/${questionList[index].image}",
                              colorLodingIcon: AppConstants.primaryColor,
                            ),
                          const SizedBox(
                            height: 20,
                          ),
                          //السوال
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: CustomText(
                              text: "${questionList[index].title}",
                              textDirection: TextDirection.ltr,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          //الازرار
                          for (var i in questionList[index].choices!)
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Container(
                                  width: 300,
                                  padding: const EdgeInsets.only(
                                      top: 11, bottom: 11, right: 7, left: 7),
                                  margin: const EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                    color: i.isCorrect == 1
                                        ?
                                        // videoController.questionList[index].answer ==i.choice?
                                        Colors.green
                                        // :AppConstants
                                        // .lightPrimaryColor

                                        : questionList[index].answer == i.choice
                                            ? Colors.red
                                            : AppConstants.primaryColor,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Center(
                                      child: CustomText(
                                    text: "${i.choice}",
                                    fontSize: 18,
                                    textDirection: TextDirection.ltr,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ))),
                            ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
