import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:edu_lens/controllers/quiz/question_controller.dart';
import 'package:edu_lens/controllers/video_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/widget/custom_buttom.dart';
import 'package:edu_lens/view/widget/custom_image_url_view.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class QuestionView extends StatelessWidget {
  QuestionView({
    Key? key,
  }) : super(key: key);
  final CarouselController _controller = CarouselController();
  QuestionController controller = Get.put(QuestionController());

  List questionList = Get.arguments['questionList'];
  List quizList = Get.arguments['quizList'];
  int indexQuiz = Get.arguments['indexQuiz'];

  @override
  Widget build(BuildContext context) {
    controller.screenWidth = MediaQuery.of(context).size.width;
    controller.screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: AppConstants.primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            quizList[indexQuiz].title.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 23),
          ),
          centerTitle: true,
          //back button delete
          leading:SizedBox(),

        ),
        body: ConnectivityWidget(
          onlineCallback: () {},
          builder: (context, isOnline) => Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.elliptical(40, 40),
                          topLeft: Radius.elliptical(40, 40)),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // SlideCountdown(
                        //   duration: const Duration(days: 2),
                        //   countUp: true,
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => controller.endTimerBool.value
                              ? Container()
                              : TweenAnimationBuilder<Duration>(
                                  duration: Duration(
                                      minutes: quizList[indexQuiz].duration!),
                                  tween: Tween(
                                      begin: Duration(
                                          minutes: quizList[indexQuiz].duration!),
                                      end: Duration.zero),
                                  onEnd: () {
                                    controller.getFinalDegreeAndEndExam(
                                        questionList: questionList);
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
                                          (quizList[indexQuiz].duration! * 60),
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
                                          Text(
                                            '$seconds',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Colors.white70,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            ':$minutes',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Colors.white70,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
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
                          height: 10,
                        ),
                        CarouselSlider(
                          carouselController: _controller,
                          items: [
                            for (int index = 0;
                                index < questionList.length;
                                index++)
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppConstants.primaryColor,
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(30),
                                ), //              height: 400,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4.0, right: 5, left: 5),
                                  child: SingleChildScrollView(
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

                                        Center(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                //الصوره
                                                if (questionList[index].image !=
                                                    null)
                                                  CustomImageUrlView(
                                                    image:
                                                        "https://edu-lens.com/images/questions/${questionList[index].image}",
                                                    height: 200,
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
                                                        "${questionList[index].title}",
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 30,
                                                ),
                                                //الازرار
                                                for (var i in questionList[index]
                                                    .choices!)
                                                  GetBuilder<VideoController>(
                                                      builder: (controller) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0,
                                                              right: 10),
                                                      child: InkWell(
                                                          onTap: () async {
                                                            questionList[index]
                                                                    .answer =
                                                                i.choice!;
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
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 20),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: questionList[
                                                                              index]
                                                                          .answer ==
                                                                      i.choice
                                                                  ? AppConstants
                                                                      .lightPrimaryColor
                                                                  : AppConstants
                                                                      .primaryColor,
                                                              border: Border.all(
                                                                  color: questionList[index]
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
                                                                  TextDirection
                                                                      .ltr,
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
                              ),
                          ],
                          // carouselController: buttonCarouselController,
                          options: CarouselOptions(
                              enlargeCenterPage: true,
                              viewportFraction: 0.8,
                              aspectRatio: 1.0,
                              initialPage: 0,
                              onPageChanged: (index, m) {
                                debugPrint(index.toString());
                              },
                              height: MediaQuery.of(context).size.height * 0.7),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
