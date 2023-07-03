import 'package:edu_lens/custom_grid_view.dart';
import 'package:edu_lens/view/widget/custom_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controllers/quiz/question_month_controller.dart';
import '../../../helper/app_constants.dart';
import '../../widget/custom_app_bar.dart';
import '../../widget/custom_image_url_view.dart';
import '../../widget/custom_list_view.dart';
import '../../widget/custom_text.dart';

class AnswerViewMonthWindows extends GetView<QuestionMonthController> {
  const AnswerViewMonthWindows({Key? key}) : super(key: key);

//"نموذج حل الامتحان"
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.back();
        Get.back();

        return Future.value(true);
      },
      child: Scaffold(
        body: CustomBackground(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.42,
                    ),
                    Text(
                      'modelAnswer'.tr,
                      style: const TextStyle(color: Colors.black, fontSize: 23),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomGridView(
                    itemCount: controller.questionList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(
                            bottom: 100, right: 100, left: 100),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppConstants.primaryColor, width: 2.0),
                          borderRadius: BorderRadius.circular(30),
                        ), //              height: 400,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 4.0, right: 5, left: 5),
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
                              if (controller.questionList[index].image != null)
                                CustomImageUrlView(
                                  image:
                                      "https://edu-lens.com/images/questions/${controller.questionList[index].image}",
                                  colorLodingIcon: AppConstants.primaryColor,
                                ),
                              const SizedBox(
                                height: 20,
                              ),
                              //السوال
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 8),
                                child: CustomText(
                                  text:
                                      "${controller.questionList[index].title}",
                                  textDirection: TextDirection.ltr,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              //الازرار
                              for (var i
                                  in controller.questionList[index].choices!)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10),
                                  child: Container(
                                      width: 300,
                                      padding: const EdgeInsets.only(
                                          top: 11,
                                          bottom: 11,
                                          right: 7,
                                          left: 7),
                                      margin: const EdgeInsets.only(top: 20),
                                      decoration: BoxDecoration(
                                        color: i.isCorrect == 1
                                            ?
                                            // videoController.questionList[index].answer ==i.choice?
                                            Colors.green
                                            // :AppConstants
                                            // .lightPrimaryColor

                                            : controller.questionList[index]
                                                        .answer ==
                                                    i.choice
                                                ? Colors.red
                                                : AppConstants.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
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
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
