import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:edu_lens/controllers/quiz/question_controller.dart';
import 'package:edu_lens/view/widget/custom_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../controllers/video_controller.dart';
import '../../../helper/app_constants.dart';
import '../../widget/custom_buttom.dart';
import '../../widget/custom_image_url_view.dart';
import '../../widget/custom_list_view.dart';
import '../../widget/custom_text.dart';

class QuestionViewWindows extends GetView<QuestionController> {
  QuestionViewWindows({Key? key}) : super(key: key);
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    List questionList = Get.arguments['questionList'];
    List quizList = Get.arguments['quizList'];
    int indexQuiz = Get.arguments['indexQuiz'];
    controller.screenWidth = MediaQuery.of(context).size.width;
    controller.screenHeight = MediaQuery.of(context).size.height;
//          quizList[indexQuiz].title.toString(),
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ConnectivityWidget(
            onlineCallback: () {},
            builder: (context, isOnline) => Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(Icons.arrow_back_ios)),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.35,
                            ),
                            Text(
                              quizList[indexQuiz].title.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 23),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Obx(
                            () => controller.endTimerBool.value
                                ? Container()
                                : TweenAnimationBuilder<Duration>(
                                    duration: Duration(
                                        minutes: quizList[indexQuiz].duration!),
                                    tween: Tween(
                                        begin: Duration(
                                            minutes:
                                                quizList[indexQuiz].duration!),
                                        end: Duration.zero),
                                    onEnd: () {
                                      controller.getFinalDegreeAndEndExam(
                                          questionList: questionList);
                                    },
                                    builder: (BuildContext context,
                                        Duration value, Widget? child) {
                                      final minutes = value.inMinutes;
                                      final seconds = value.inSeconds % 60;
                                      return LinearPercentIndicator(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                50,
                                        animation: false,
                                        lineHeight: 30.0,
                                        barRadius: const Radius.circular(15),
                                        alignment: MainAxisAlignment.center,
                                        animationDuration: 0,
                                        percent: value.inSeconds.toDouble() /
                                            (quizList[indexQuiz].duration! *
                                                60),
                                        center: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.timer,
                                              color: Colors.white70,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            minutes > 1
                                                ? Text('$minutes:00 ',
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        color: Colors.white70,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15))
                                                : Text(' 00:$seconds',
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        color: Colors.white70,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15))
                                          ],
                                        ),
                                        linearStrokeCap: LinearStrokeCap.butt,
                                        progressColor: minutes > minutes / 5
                                            ? Colors.green
                                            : minutes < 1
                                                ? Colors.red
                                                : Colors.red.shade300,
                                      );
                                    }),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: CustomListView(
                            itemCount: questionList.length,
                            itemBuilder: (context, index) => SizedBox(
                              width: 400,
                              height: 360,
                              child: Column
                                (
                                children: [
                                  CustomText(
                                    text: "( ${index + 1} )",
                                    fontSize: 30,
                                  ),
                                  if ( questionList[index].image !=
                                      null)
                                    CustomImageUrlView(
                                      image:
                                      "https://edu-lens.com/images/questions/${questionList[index].image}",
                                      colorLodingIcon:
                                      AppConstants.primaryColor,
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8),
                                    child: CustomText(
                                      text:
                                      "${questionList[index].title}",
                                      textDirection: TextDirection.ltr,
                                      fontSize: 20,
                                    ),
                                  ),

                                  for (var i in questionList[index].choices!)
                                    GetBuilder<QuestionController>(
                                        builder: (controller) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, right: 10),
                                            child: InkWell(
                                                onTap: () async {
                                                  questionList[index]
                                                      .answer = i.choice!;
                                                  controller.update();
                                                },
                                                child: Container(
                                                  width: 300,
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 9,
                                                      bottom: 9,
                                                      right: 7,
                                                      left: 7),
                                                  margin:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  decoration: BoxDecoration(
                                                    color: questionList[
                                                    index]
                                                        .answer ==
                                                        i.choice
                                                        ? AppConstants
                                                        .lightPrimaryColor
                                                        :  Colors.white,
                                                    border: Border.all(
                                                        color:questionList[
                                                        index]
                                                            .answer ==
                                                            i.choice
                                                            ? AppConstants
                                                            .lightPrimaryColor
                                                            : AppConstants.primaryColor,
                                                        width: 2.0),
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(30.0),
                                                  ),
                                                  child: Center(
                                                      child: CustomText(
                                                        text: "${i.choice}",
                                                        fontSize: 18,
                                                        textDirection:
                                                        TextDirection.ltr,
                                                        color: questionList[
                                                        index]
                                                            .answer ==
                                                            i.choice
                                                            ?  Colors.white:AppConstants.primaryColor,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      )),
                                                )),
                                          );
                                        }),
                                  SizedBox(height: controller.screenHeight!*0.05,),
                                  Container(height: 1,width: controller.screenWidth!*0.5 ,color: Colors.grey,),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 18,
                        ),
                        CustomButton(
                          function: () async {
                            try {
                              controller.endTimerBool.value = true;
                              controller.checkTheQuestionAnswer(
                                  context: context,
                                  controller: _controller,
                                  questionList: questionList);
                            } catch (E) {
                              debugPrint(E.toString());
                            }
                            // checkTheQuestionAnswer(context: context);
                          },
                          text: "saveAnswer".tr,
                          height: 50,
                          width: 200,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
