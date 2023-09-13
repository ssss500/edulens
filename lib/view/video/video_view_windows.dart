import 'dart:developer';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edu_lens/controllers/quiz/question_controller.dart';
import 'package:edu_lens/view/widget/custom_background.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:screen_protector/screen_protector.dart';

//import 'package:webview_windows/webview_windows.dart';
import '../../controllers/home/home_controllers.dart';
import '../../controllers/pdf_controller.dart';
import '../../controllers/video_controller.dart';
import '../../helper/app_constants.dart';
import '../../helper/cashe_helper.dart';
import '../../routes/routes_names.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_dialog/snackBar.dart';
import '../widget/custom_list_view.dart';
import '../widget/custom_loading.dart';
import '../widget/custom_text.dart';

class VideoViewWindows extends GetView<VideoController> {
  VideoViewWindows({Key? key}) : super(key: key);
  PDFController pdfController = Get.put(PDFController());
  HomeController homeController = Get.find();
  String title = Get.arguments['title']??"";

  @override
  Widget build(BuildContext context) {
    //Get.put(VideoController());

    return WillPopScope(
      onWillPop: () async {
        try {
          // videoController.controller.dispose();
          Get.delete<VideoController>();
        } catch (e) {
          log(e.toString());
        }
        debugPrint("pause");
        return Future.value(true);
      },
      child: CustomBackground(
          child: SingleChildScrollView(
        child: Obx(
          () => Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      title,
                      style: const TextStyle(
                          color: AppConstants.lightPrimaryColor, fontSize: 23),
                    ),
                  ],
                ),
                // Webview(
                //   controller.webController,
                //   permissionRequested: controller.onPermissionRequested,
                // ),
                // StreamBuilder<LoadingState>(
                //     stream: controller.webController.loadingState,
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData &&
                //           snapshot.data == LoadingState.loading) {
                //         return LinearProgressIndicator();
                //       } else {
                //         return SizedBox();
                //       }
                //     }),

                // SizedBox(
                //   height: 600,
                //   width: 1000,
                //   child: WebviewScaffold(
                //     url: controller.videoPage(),
                //     //controller.videoPage(), // Replace with your desired URL
                //     withZoom: true,
                //     withLocalStorage: true,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    children: [
                      if (controller.pdfList.isNotEmpty)
                        SizedBox(
                          height: 500,
                          width: 450,
                          child: CustomListView(
                            itemCount: controller.pdfList.length,
                            itemBuilder: (context, index) {
                              return itemPdf(
                                  title: controller.pdfList[index].title,
                                  index: index);
                            },
                          ),
                        ),
                      if (controller.quizList.isNotEmpty)
                        SizedBox(
                          height: 500,
                          width: 450,
                          child: CustomListView(
                            itemCount: controller.quizList.length,
                            itemBuilder: (context, index) {
                              return itemQuiz(
                                  idQuiz: controller.quizList[index].id,
                                  indexQuiz: index);
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ]),
        ),
      )),
    );
  }

  Widget itemQuiz({idQuiz, indexQuiz}) {
    return Obx(
      () => SizedBox(
        width: 300,
        child: InkWell(
          onTap: () async {
            if (!homeController.solvedExams
                    .any((element) => element.id == idQuiz) ||
                kDebugMode) {
              Get.dialog(const CustomLoading());
              debugPrint(idQuiz.toString());
              controller.idQuiz = idQuiz;
              controller.indexQuiz = indexQuiz;
              try {
                // videoController.controller.pause();
              } catch (e) {
                debugPrint(e.toString());
              }
              debugPrint(
                  "studentId : ${CacheHelper.getData(key: AppConstants.studentId)}");
              await controller.getQuestions();
              Get.back();
              debugPrint('after back : ${controller.questionList.length}');
              QuestionController questionController =
                  Get.put(QuestionController());
              // questionController.start.value=videoController.quizList[indexQuiz].duration!;
              // questionController.startTimer();
              questionController.endTimerBool.value = false;
              Get.toNamed(RoutesNames.questionView, arguments: {
                'questionList': controller.questionList,
                'quizList': controller.quizList,
                'indexQuiz': controller.indexQuiz,
              });
            } else {
              showCustomSnackBar(
                  context: Get.context,
                  title: "note".tr,
                  deck: "تم حل الامتحان من قبل",
                  contentType: ContentType.failure);
            }
          },
          child: Container(
            height: 90,
            width: 300,
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
              )
            ], color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Row(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 15.0, top: 20, bottom: 20),
                      child: Image.asset(
                        "assets/images/quiz.png",
                        color: AppConstants.lightPrimaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: SizedBox(
                        // height: 40,
                        width: 300,
                        child: homeController.solvedExams
                                .any((element) => element.id == idQuiz)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomText(
                                    text:
                                        "  ${controller.quizList[indexQuiz].title}",
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
                                    "  ${controller.quizList[indexQuiz].title}",
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
        ),
      ),
    );
  }

  Widget itemPdf({title, index}) {
    return SizedBox(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
        child: InkWell(
          onTap: () {
            controller.indexPdf = index;
            try {
              // videoController.controller.pause();
            } catch (e) {
              debugPrint(e.toString());
            }
            pdfController.pdfUrl = controller.pdfList[index].file;
            // pdfController.type = item['pdfType'];
            pdfController.title = controller.pdfList[index].title;
            pdfController.pdfUrl = controller.pdfList[index].file;
            // pdfController.downloadFile = item['downloadFile'];
            pdfController.loadPDF();
            pdfController.onInit();
            // debugPrint(videoController.pdfList.first.toJson().toString());
            Get.toNamed(RoutesNames.pdfView,
                arguments: {'pdfModel': controller.pdfList[index]});
          },
          child: Container(
            height: 90,
            width: 300,
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.only(left: 10, right: 0),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
              )
            ], color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 15.0, top: 20, bottom: 20),
                  child: Image.asset(
                    "assets/images/pdf.png",
                    color: AppConstants.lightPrimaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: SizedBox(
                    // height: 40,
                    width: 300,
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
        ),
      ),
    );
  }
}
