import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/controllers/home_courses_controller.dart';
import 'package:edu_lens/model/courses_models/pdf_model.dart';
import 'package:edu_lens/model/courses_models/question_model.dart';
import 'package:edu_lens/model/courses_models/quiz_model.dart';
import 'package:edu_lens/model/lecture_paid_model.dart';
import 'package:edu_lens/services/get_video_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';

class VideoController extends GetxController {
  final services = GetVideoExtensions();
  final pdfList = <PdfModel>[].obs;
  final quizList = <QuizModel>[].obs;
  final questionList = <QuestionModel>[].obs;
  late final PodPlayerController controller;
  RxBool mustSolveExam = false.obs;
  var indexPdf = 0;
  var idQuiz = 0;

  var indexQuiz = 0;

  @override
  void dispose() {
    super.dispose();
    try {
      controller.dispose();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  openVideo() {
    HomeCoursesController homeCoursesController =
        Get.put(HomeCoursesController());
    debugPrint(
        "youtube link : ${homeCoursesController.chapters[homeCoursesController.indexChapters].lectures![homeCoursesController.indexLectures].toJson()}");
    if (homeCoursesController.chapters[homeCoursesController.indexChapters]
            .lectures![homeCoursesController.indexLectures].vLink !=
        null) {
      String idVideo = homeCoursesController
          .chapters[homeCoursesController.indexChapters]
          .lectures![homeCoursesController.indexLectures]
          .vLink
          .toString();
      debugPrint("idVideo : $idVideo");
      idVideo = idVideo.split("?")[0];
      debugPrint("idVideo : $idVideo");

      try {
        controller = PodPlayerController(
          playVideoFrom: PlayVideoFrom.vimeo(
            idVideo,
            videoPlayerOptions: VideoPlayerOptions(
              allowBackgroundPlayback: true,
            ),
          ),
        )..initialise();
      } catch (e) {
        debugPrint(e.toString());
        controller.changeVideo(
          playVideoFrom: PlayVideoFrom.vimeo(
            idVideo,
            videoPlayerOptions: VideoPlayerOptions(
              allowBackgroundPlayback: true,
            ),
          ),
        );
      }
    } else {
      String idVideo = homeCoursesController
          .chapters[homeCoursesController.indexChapters]
          .lectures![homeCoursesController.indexLectures]
          .video;
      debugPrint(
          "youtube link : ${homeCoursesController.chapters[homeCoursesController.indexChapters].lectures![homeCoursesController.indexLectures].toJson()}");
      try {
        controller = PodPlayerController(
          playVideoFrom: PlayVideoFrom.youtube(
            idVideo,
            videoPlayerOptions: VideoPlayerOptions(
              allowBackgroundPlayback: true,
            ),
          ),
        )..initialise();
      } catch (e) {
        debugPrint(e.toString());
        controller.changeVideo(
          playVideoFrom: PlayVideoFrom.youtube(
            idVideo,
            videoPlayerOptions: VideoPlayerOptions(
              allowBackgroundPlayback: true,
            ),
          ),
        );
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
    if (lecturePaidModel.vLink !=
        null) {
      String idVideo = lecturePaidModel
          .vLink
          .toString();
      debugPrint("idVideo : $idVideo");
      idVideo = idVideo.split("?")[0];
      debugPrint("idVideo : $idVideo");

      try {
        controller = PodPlayerController(
          playVideoFrom: PlayVideoFrom.vimeo(
            idVideo,
            videoPlayerOptions: VideoPlayerOptions(
              allowBackgroundPlayback: true,
            ),
          ),
        )..initialise();
      } catch (e) {
        debugPrint(e.toString());
        controller.changeVideo(
          playVideoFrom: PlayVideoFrom.vimeo(
            idVideo,
            videoPlayerOptions: VideoPlayerOptions(
              allowBackgroundPlayback: true,
            ),
          ),
        );
      }
    } else {
      String idVideo = lecturePaidModel
          .video.toString();
      try {
        controller = PodPlayerController(
          playVideoFrom: PlayVideoFrom.youtube(
            idVideo,
            videoPlayerOptions: VideoPlayerOptions(
              allowBackgroundPlayback: true,
            ),
          ),
        )..initialise();
      } catch (e) {
        debugPrint(e.toString());
        controller.changeVideo(
          playVideoFrom: PlayVideoFrom.youtube(
            idVideo,
            videoPlayerOptions: VideoPlayerOptions(
              allowBackgroundPlayback: true,
            ),
          ),
        );
      }
    }
  }

  getVideoExtensionsPayed({required LecturePaidModel lecturePaidModel}) async {
    checkMustSolveExam();
    pdfList.value = (await services.getPDFPayed(lecturePaidModel:lecturePaidModel))!;
    quizList.value = (await services.getQuizPayed(lecturePaidModel:lecturePaidModel))!;
  }
}
