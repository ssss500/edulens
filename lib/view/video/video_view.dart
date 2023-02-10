// import 'package:better_player/better_player.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/controllers/home_courses_controller.dart';
import 'package:edu_lens/controllers/video_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/cashe_helper.dart';
import 'package:edu_lens/view/home_courses_view.dart';
import 'package:edu_lens/view/pdf_view.dart';
import 'package:edu_lens/view/quiz/answer_quiz_view.dart';
import 'package:edu_lens/view/quiz/question_view.dart';
import 'package:edu_lens/view/widget/custom_app_bar.dart';
import 'package:edu_lens/view/widget/custom_dialog/snackBar.dart';
import 'package:edu_lens/view/widget/custom_list_view.dart';
import 'package:edu_lens/view/widget/custom_loading.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';
// import 'package:vimeoplayer_trinity/vimeoplayer_trinity.dart';

class VideoView extends StatelessWidget {
  VideoController videoController = Get.put(VideoController());

  HomeController homeController = Get.put(HomeController());

  VideoView({required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // homeCoursesController.controller.pause();
        // videoController.;
        videoController.controller.dispose();
        Get.delete<VideoController>();
        debugPrint("pause");

        return Future.value(true);
      },
      child: CustomAppBar(
          functionBake: () {
            // homeCoursesController.controller.pause();
            // videoController.;
            videoController.controller.dispose();
            Get.delete<VideoController>();
            debugPrint("pause");
          },
          title: title,
          widget: SingleChildScrollView(
            child: Obx(
              () => Column(
                children: [
                  if (!videoController.mustSolveExam.value)
                    PodVideoPlayer(
                      controller: videoController.controller,
                    )
                  else
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.elliptical(40, 40),
                              topLeft: Radius.elliptical(40, 40))),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 80,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomText(
                              text: "mustSolveExamBeforeWatchVideos".tr,
                            )
                          ],
                        ),
                      ),
                    ),
                  // BetterPlayer(
                  //     controller: homeCoursesController.betterPlayerController),
                  ///
                  // Container(
                  //   color: Colors.black,
                  //   child: VimeoPlayer(
                  //     id: '748835172',
                  //     autoPlay: false,
                  //     loaderColor: AppConstants.primaryColor,
                  //     loaderBackgroundColor: Colors.white70,
                  //   ),
                  // ),
                  if (videoController.pdfList.isNotEmpty)
                    const SizedBox(
                      height: 20,
                    ),
                  CustomListView(
                    itemCount: videoController.pdfList.length,
                    itemBuilder: (context, index) {
                      return itemPdf(
                          title: videoController.pdfList[index].title,
                          index: index);
                    },
                  ),
                  if (videoController.quizList.isNotEmpty)
                    const SizedBox(
                      height: 15,
                    ),
                  CustomListView(
                    itemCount: videoController.quizList.length,
                    itemBuilder: (context, index) {
                      return itemQuiz(
                          idQuiz: videoController.quizList[index].id,
                          indexQuiz: index);
                    },
                  ),
                  //
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // itemQuizAnswer(),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // itemQuizVideoAnswer(),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // itemHomeWork(),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                ],
              ),
            ),
          )),
    );
  }

  Widget itemPdf({title, index}) {
    return InkWell(
      onTap: () {
        videoController.indexPdf = index;
        videoController.controller.pause();
        debugPrint(videoController.pdfList.first.toJson().toString());
        Get.to(() => PdfView(pdfModel: videoController.pdfList[index]));
      },
      child: Container(
        height: 90,
        margin: const EdgeInsets.only(left: 10, right: 10),
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0, top: 20, bottom: 20),
              child: Image.asset(
                "assets/images/pdf.png",
                color: AppConstants.lightPrimaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Container(
                // height: 40,
                width: MediaQuery.of(Get.context!).size.width - 150,
                child: CustomText(
                  text: "${title!}",
                  fontSize: 19,
                  maxLines: 3,
                  alignment: Alignment.centerRight,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 28,
              color: AppConstants.lightPrimaryColor,
            )
          ],
        ),
      ),
    );
  }

  Widget itemQuiz({idQuiz, indexQuiz}) {
    return InkWell(
      onTap: () async {

        if (!homeController.solvedExams.any((element) => element.id == idQuiz)||kDebugMode) {
          Get.dialog(CustomLoading());
          debugPrint(idQuiz.toString());
          videoController.idQuiz = idQuiz;
          videoController.indexQuiz = indexQuiz;
          videoController.controller.pause();
          debugPrint(
              "studentId : ${CacheHelper.getData(key: AppConstants.studentId)}");
          await videoController.getQuestions();
          Get.back();
          debugPrint('after back : ${videoController.questionList.length}');
          Get.to(() => QuestionView(
                questionList: videoController.questionList,
                quizList: videoController.quizList,
                indexQuiz: videoController.indexQuiz,
              ));
        }else{
          showCustomSnackBar( context: Get.context,
              title: "note".tr,
              deck: "تم حل الامتحان من قبل",
              contentType: ContentType.failure);
        }
      },
      child: Container(
        height: 90,
        margin: const EdgeInsets.only(left: 10, right: 10),
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 15.0, top: 20, bottom: 20),
                  child: Image.asset(
                    "assets/images/quiz.png",
                    color: AppConstants.lightPrimaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: SizedBox(
                    // height: 40,
                    width: MediaQuery.of(Get.context!).size.width - 160,
                    child: homeController.solvedExams
                            .any((element) => element.id == idQuiz)
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                text:
                                    "  ${videoController.quizList[indexQuiz].title}",
                                fontSize: 19,
                                maxLines: 3,
                                alignment: Alignment.centerRight,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: CustomText(
                                  text:
                                      "${"examAlreadySolved".tr} (${homeController.solvedExams[homeController.solvedExams.indexWhere((element) => element.id == idQuiz)].pivot!.degree}) ${"degree".tr} ",
                                  fontSize: 13,
                                  maxLines: 3,
                                  alignment: Alignment.centerRight,
                                  color: Colors.black87,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          )
                        : CustomText(
                            text:
                                "  ${videoController.quizList[indexQuiz].title}",
                            fontSize: 19,
                            maxLines: 3,
                            alignment: Alignment.centerRight,
                          ),
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 30,
              color: AppConstants.lightPrimaryColor,
            )
          ],
        ),
      ),
    );
  }

// Widget itemQuizAnswer() {
//   return InkWell(
//     onTap: () {
//       Get.to(() => AnswerQuizView());
//     },
//     child: Container(
//       height: 90,
//       margin: const EdgeInsets.only(left: 10, right: 10),
//       padding: const EdgeInsets.only(left: 10, right: 10),
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(25)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Image.asset(
//                   "assets/images/quiz.png",
//                   color: AppConstants.primaryColor,
//                 ),
//               ),
//               const SizedBox(
//                 width: 4,
//               ),
//               CustomText(
//                 text: "نموذج اجابة الامتحان",
//                 fontSize: 20,
//               ),
//             ],
//           ),
//           const Icon(
//             Icons.arrow_forward_ios_sharp,
//             size: 30,
//             color: AppConstants.lightPrimaryColor,
//           )
//         ],
//       ),
//     ),
//   );
// }

// Widget itemQuizVideoAnswer() {
//   return InkWell(
//     onTap: () {
//       Get.to(() => AnswerQuizView());
//     },
//     child: Container(
//       height: 90,
//       margin: EdgeInsets.only(left: 10, right: 10),
//       padding: EdgeInsets.only(left: 10, right: 10),
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(25)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Image.asset(
//                   "assets/images/home_work.png",
//                   color: AppConstants.primaryColor,
//                 ),
//               ),
//               const SizedBox(
//                 width: 4,
//               ),
//               CustomText(
//                 text: "فيديو الواجب",
//                 fontSize: 20,
//               ),
//             ],
//           ),
//           const Icon(
//             Icons.arrow_forward_ios_sharp,
//             size: 30,
//             color: AppConstants.lightPrimaryColor,
//           )
//         ],
//       ),
//     ),
//   );
// }

// Widget itemHomeWork() {
//   return InkWell(
//     onTap: () {
//       videoController.controller.pause();
//       debugPrint(videoController.pdfList.toJson().toString());
//       // Get.to(() => PdfView());
//     },
//     child: Container(
//       height: 90,
//       margin: const EdgeInsets.only(left: 10, right: 10),
//       padding: const EdgeInsets.only(left: 10, right: 10),
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(25)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Image.asset(
//                   "assets/images/home_work.png",
//                   color: AppConstants.primaryColor,
//                 ),
//               ),
//               const SizedBox(
//                 width: 4,
//               ),
//               CustomText(
//                 text: "الواجب",
//                 fontSize: 20,
//               ),
//             ],
//           ),
//           const Icon(
//             Icons.arrow_forward_ios_sharp,
//             size: 30,
//             color: AppConstants.lightPrimaryColor,
//           )
//         ],
//       ),
//     ),
//   );
// }
}
