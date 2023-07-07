import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/controllers/home_courses_controller.dart';
import 'package:edu_lens/model/courses_models/pdf_model.dart';
import 'package:edu_lens/model/courses_models/question_model.dart';
import 'package:edu_lens/model/courses_models/quiz_model.dart';
import 'package:edu_lens/model/lecture_paid_model.dart';
import 'package:edu_lens/services/get_video_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:pod_player/pod_player.dart';
import 'package:screen_protector/screen_protector.dart';
//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

//import 'package:webview_windows/webview_windows.dart';


class VideoController extends GetxController {
  final services = GetVideoExtensions();
  final pdfList = <PdfModel>[].obs;
  final quizList = <QuizModel>[].obs;
  final questionList = <QuestionModel>[].obs;
  //late final PodPlayerController controller;
  RxBool mustSolveExam = false.obs;
  late String idVideoForPaidModel = "", idVideoForPaidModelYoutube;
  var indexPdf = 0;
  var idQuiz = 0;
  //late final Video? youtubeExplode;
  //final webController = WebviewController();

  //final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();


  var indexQuiz = 0;

  @override
  Future<void> dispose() async {
    super.dispose();
    try {
      if (Platform.isIOS) {
        await ScreenProtector.preventScreenshotOff();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    //showWebView();
   // await webController.loadUrl(_videoPage());
log(videoPage());
    openVideo();
    getVideoExtensions();
    if (Platform.isIOS) {
      await ScreenProtector.preventScreenshotOn();
    }
  }
  // showWebView()async{
  //   final url = videoPage();
  //   Webview(true)
  //       .setTitle("Google")
  //       .setSize(1280, 800,
  //       SizeHint.none /* Sizehint is optional and can be omitted */)
  //       .navigate(url)
  //       .run();
  // }
  String videoPage() {
    const html = '''
            <html>
              <head>
                <style>
                  body {
                   background-color: lightgray;
                   margin: 0px;
                   }
                </style>
                <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0">
                <meta http-equiv="Content-Security-Policy"
                content="default-src * gap:; script-src * 'unsafe-inline' 'unsafe-eval'; connect-src *;
                img-src * data: blob: android-webview-video-poster:; style-src * 'unsafe-inline';">
             </head>
             <body>
                <iframe
                src="https://player.vimeo.com/video/70591644?loop=0&autoplay=0"
                width="100%" height="100%" frameborder="0" allow="fullscreen"
                allowfullscreen></iframe>
             </body>
            </html>
            ''';
    final String contentBase64 =
    base64Encode(const Utf8Encoder().convert(html));
    return 'data:text/html;base64,$contentBase64';
  }
  openVideo({lecturePaidModel}) async {
    if (lecturePaidModel != null) {
      idVideoForPaidModelYoutube = lecturePaidModel.video.toString();
    }
    HomeCoursesController homeCoursesController =
        Get.put(HomeCoursesController());
    if (lecturePaidModel == null
        ? homeCoursesController.chapters[homeCoursesController.indexChapters]
                .lectures[homeCoursesController.indexLectures].video ==
            null
        : idVideoForPaidModelYoutube == 'null' ||
            idVideoForPaidModelYoutube == '') {
      String idVideo = lecturePaidModel == null
          ? homeCoursesController.chapters[homeCoursesController.indexChapters]
              .lectures[homeCoursesController.indexLectures].vLink
              .toString()
          : lecturePaidModel.vLink.toString();
      debugPrint("idVideo : $idVideo");
      idVideo = idVideo.split("?")[0];
      debugPrint("idVideo : $idVideo");
      try {
        if (Platform.isWindows) {
        } else {
          // controller = PodPlayerController(
          //   playVideoFrom: PlayVideoFrom.vimeo(
          //     idVideo,
          //     videoPlayerOptions: VideoPlayerOptions(
          //       allowBackgroundPlayback: true,
          //     ),
          //   ),
          // )..initialise();
        }
      } catch (e) {
        debugPrint(e.toString());
        // controller.changeVideo(
        //   playVideoFrom: PlayVideoFrom.vimeo(
        //     idVideo,
        //     videoPlayerOptions: VideoPlayerOptions(
        //       allowBackgroundPlayback: true,
        //     ),
        //   ),
        // );
      }
    } else {
      String? idVideo = lecturePaidModel == null
          ? homeCoursesController.chapters[homeCoursesController.indexChapters]
              .lectures[homeCoursesController.indexLectures].video
          : lecturePaidModel.video.toString();
      debugPrint("idVideo : $idVideo");
      // debugPrint(
      //     "youtube link : ${homeCoursesController.chapters[homeCoursesController.indexChapters].lectures[homeCoursesController.indexLectures].toJson()}");
      try {
        if (Platform.isWindows) {
          // youtubeExplode = await YoutubeExplode()
          //     .videos
          //     .get('https://youtube.com/watch?v=$idVideo');
          // log('windows video: ${youtubeExplode!.id}');
        } else {
          // controller = PodPlayerController(
          //   playVideoFrom: PlayVideoFrom.youtube(
          //     idVideo!,
          //     videoPlayerOptions: VideoPlayerOptions(
          //       allowBackgroundPlayback: true,
          //     ),
          //   ),
          // )..initialise();
        }
      } catch (e) {
        debugPrint(e.toString());
        // controller.changeVideo(
        //   playVideoFrom: PlayVideoFrom.youtube(
        //     idVideo!,
        //     videoPlayerOptions: VideoPlayerOptions(
        //       allowBackgroundPlayback: true,
        //     ),
        //   ),
        // );
      }
    }
  }

  getVideoExtensions() async {
    pdfList.value = (await services.getPDF())!;
    quizList.value = (await services.getQuiz())!;
    checkMustSolveExam();
  }

  getQuestions() async {
    debugPrint("getQuestions1");
    questionList.value = (await services.getQuestion(idQuiz: idQuiz))!;
    debugPrint("getQuestions2");
    await services.startExam(examId: idQuiz);
    debugPrint(" questionList.value : $questionList");
  }

  endExam({degree}) async {
    final result = await services.endExam(examId: idQuiz, degree: degree);
    return result;
  }

  void checkMustSolveExam() {
    HomeController homeController = Get.put(HomeController());
    for (var item in quizList) {
      if (item.must == 1) {
        if (homeController.solvedExams
            .any((element) => element.id == item.id)) {
          mustSolveExam.value = false;
        } else {
          mustSolveExam.value = true;
        }
      }
    }
  }

  openVideoPayed({required LecturePaidModel lecturePaidModel}) {
    idVideoForPaidModelYoutube = lecturePaidModel.video.toString();
    // ignore: unnecessary_null_comparison
    if (idVideoForPaidModelYoutube == 'null' ||
        idVideoForPaidModelYoutube == '') {
      String idVideo = lecturePaidModel.vLink.toString();
      debugPrint("idVideo : $idVideo");
      idVideoForPaidModel = idVideo.split("?")[0];
      debugPrint("idVideo : $idVideo");

      try {
        // controller = PodPlayerController(
        //   playVideoFrom: PlayVideoFrom.vimeo(
        //     idVideo,
        //     videoPlayerOptions: VideoPlayerOptions(
        //       allowBackgroundPlayback: true,
        //     ),
        //   ),
        // )..initialise();
      } catch (e) {
        debugPrint(e.toString());
        // controller.changeVideo(
        //   playVideoFrom: PlayVideoFrom.vimeo(
        //     idVideo,
        //     videoPlayerOptions: VideoPlayerOptions(
        //       allowBackgroundPlayback: true,
        //     ),
        //   ),
        // );
      }
    } else {
      try {
        // controller = PodPlayerController(
        //   playVideoFrom: PlayVideoFrom.youtube(
        //     idVideoForPaidModelYoutube,
        //     videoPlayerOptions: VideoPlayerOptions(
        //       allowBackgroundPlayback: true,
        //     ),
        //   ),
        // )..initialise();
      } catch (e) {
        debugPrint(e.toString());
        // controller.changeVideo(
        //   playVideoFrom: PlayVideoFrom.youtube(
        //     idVideoForPaidModelYoutube,
        //     videoPlayerOptions: VideoPlayerOptions(
        //       allowBackgroundPlayback: true,
        //     ),
        //   ),
        // );
      }
    }
  }

  getVideoExtensionsPayed({required LecturePaidModel lecturePaidModel}) async {
    checkMustSolveExam();
    pdfList.value =
        (await services.getPDFPayed(lecturePaidModel: lecturePaidModel))!;
    quizList.value =
        (await services.getQuizPayed(lecturePaidModel: lecturePaidModel))!;
  }
  final navigatorKey = GlobalKey<NavigatorState>();

  // Future<WebviewPermissionDecision> onPermissionRequested(
  //     String url, WebviewPermissionKind kind, bool isUserInitiated) async {
  //   final decision = await showDialog<WebviewPermissionDecision>(
  //     context: navigatorKey.currentContext!,
  //     builder: (BuildContext context) => AlertDialog(
  //       title: const Text('WebView permission requested'),
  //       content: Text('WebView has requested permission \'$kind\''),
  //       actions: <Widget>[
  //         TextButton(
  //           onPressed: () =>
  //               Navigator.pop(context, WebviewPermissionDecision.deny),
  //           child: const Text('Deny'),
  //         ),
  //         TextButton(
  //           onPressed: () =>
  //               Navigator.pop(context, WebviewPermissionDecision.allow),
  //           child: const Text('Allow'),
  //         ),
  //       ],
  //     ),
  //   );
  //
  //   return decision ?? WebviewPermissionDecision.none;
  // }
}
