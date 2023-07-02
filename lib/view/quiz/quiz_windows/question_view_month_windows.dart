import 'package:carousel_slider/carousel_slider.dart';
import 'package:edu_lens/view/widget/custom_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../controllers/profile_teacher_controller.dart';
import '../../../controllers/quiz/question_month_controller.dart';
import '../../../helper/app_constants.dart';
import '../../widget/custom_buttom.dart';
import '../../widget/custom_image_url_view.dart';
import '../../widget/custom_text.dart';

class QuestionViewMonthWindows extends GetView {
  QuestionViewMonthWindows({Key? key}) : super(key: key);
  final CarouselController _controller = CarouselController();

//         profileTeacherController
//       //         .monthExamTeacher[questionMonthController.indexQuiz].title!,
  @override
  Widget build(BuildContext context) {
    QuestionMonthController questionMonthController = Get.find();
    ProfileTeacherController profileTeacherController = Get.find();
    questionMonthController.screenWidth = MediaQuery.of(context).size.width;
    questionMonthController.screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: CustomBackground(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back_ios)),
                          SizedBox(width: MediaQuery.sizeOf(context).width*0.35,),
                          Text(
                            profileTeacherController
                                .monthExamTeacher[questionMonthController.indexQuiz].title!,
                            style: const TextStyle(color: Colors.black, fontSize: 23),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Obx(
                        () => questionMonthController.endTimerBool.value
                            ? Container()
                            : TweenAnimationBuilder<Duration>(
                                duration: Duration(
                                    minutes: profileTeacherController
                                        .monthExamTeacher[
                                            questionMonthController.indexQuiz]
                                        .duration!),
                                tween: Tween(
                                    begin: Duration(
                                        minutes: profileTeacherController
                                            .monthExamTeacher[
                                                questionMonthController
                                                    .indexQuiz]
                                            .duration!),
                                    end: Duration.zero),
                                onEnd: () {
                                  questionMonthController
                                      .getFinalDegreeAndEndExam();
                                },
                                builder: (BuildContext context, Duration value,
                                    Widget? child) {
                                  final minutes = value.inMinutes;
                                  final seconds = value.inSeconds % 60;
                                  return LinearPercentIndicator(
                                    width:
                                        MediaQuery.of(context).size.width - 50,
                                    animation: false,
                                    lineHeight: 30.0,
                                    barRadius: const Radius.circular(15),
                                    alignment: MainAxisAlignment.center,
                                    animationDuration: 0,
                                    percent: value.inSeconds.toDouble() /
                                        (profileTeacherController
                                                .monthExamTeacher[
                                                    questionMonthController
                                                        .indexQuiz]
                                                .duration! *
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
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15))
                                            : Text(' 00:$seconds',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.white70,
                                                    fontWeight: FontWeight.bold,
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
                      const SizedBox(
                        height: 30,
                      ),
                      CarouselSlider(
                        carouselController: _controller,
                        items: [
                          for (int index = 0;
                              index <
                                  questionMonthController.questionList.length;
                              index++)
                            Container(
                              width: MediaQuery.sizeOf(context).width / 3,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppConstants.primaryColor,
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(30),
                              ), //              height: 400,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 4.0, right: 5, left: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
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

                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            //الصوره
                                            if (questionMonthController
                                                    .questionList[index]
                                                    .image !=
                                                null)
                                              CustomImageUrlView(
                                                image:
                                                    "https://edu-lens.com/images/questions/${questionMonthController.questionList[index].image}",
                                                colorLodingIcon:
                                                    AppConstants.primaryColor,
                                              ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            //السوال
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, right: 8),
                                              child: CustomText(
                                                text:
                                                    "${questionMonthController.questionList[index].title}",
                                                textDirection:
                                                    TextDirection.ltr,
                                                fontSize: 20,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            // //الازرار
                                            for (var i
                                                in questionMonthController
                                                    .questionList[index]
                                                    .choices!)
                                              GetBuilder<
                                                      QuestionMonthController>(
                                                  builder: (controller) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10.0,
                                                          right: 10),
                                                  child: InkWell(
                                                      onTap: () async {
                                                        questionMonthController
                                                            .questionList[index]
                                                            .answer = i.choice!;
                                                        controller.update();
                                                      },
                                                      child: Container(
                                                        width: 300,
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 9,
                                                                bottom: 9,
                                                                right: 7,
                                                                left: 7),
                                                        margin: const EdgeInsets
                                                            .only(top: 20),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: questionMonthController
                                                                      .questionList[
                                                                          index]
                                                                      .answer ==
                                                                  i.choice
                                                              ? AppConstants
                                                                  .lightPrimaryColor
                                                              : AppConstants
                                                                  .primaryColor,
                                                          border: Border.all(
                                                              color: questionMonthController
                                                                          .questionList[
                                                                              index]
                                                                          .answer ==
                                                                      i.choice
                                                                  ? AppConstants
                                                                      .lightPrimaryColor
                                                                  : AppConstants
                                                                      .primaryColor,
                                                              width: 2.0),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30.0),
                                                        ),
                                                        child: Center(
                                                            child: CustomText(
                                                          text: "${i.choice}",
                                                          fontSize: 18,
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        )),
                                                      )),
                                                );
                                              }),

                                            const SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                        // carouselController: buttonCarouselController,
                        options: CarouselOptions(
                            enlargeCenterPage: true,
                            viewportFraction: 0.4,
                            aspectRatio: 1.0,
                            initialPage: 0,
                            onPageChanged: (index, m) {
                              debugPrint(index.toString());
                            },
                            height: MediaQuery.of(context).size.height * 0.7),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        function: () {
                          questionMonthController.endTimerBool.value = true;

                          try {
                            questionMonthController.checkTheQuestionAnswer(
                                context: context, controller: _controller);
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
            ),
          ],
        ),
      ),
    );
  }
}
