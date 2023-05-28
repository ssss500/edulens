import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:edu_lens/controllers/main_controller.dart';
import 'package:edu_lens/helper/cashe_helper.dart';
import 'package:edu_lens/model/chapter_paid_model.dart';
import 'package:edu_lens/model/classes_model.dart';
import 'package:edu_lens/model/courses_models/solved_exams_model.dart';
import 'package:edu_lens/model/cover_model.dart';
import 'package:edu_lens/model/lecture_paid_model.dart';
import 'package:edu_lens/model/student_reservations_model.dart';
import 'package:edu_lens/model/subject_model.dart';
import 'package:edu_lens/model/teacher_model.dart';
import 'package:edu_lens/model/user_model.dart';
import 'package:edu_lens/services/get_teacher_services.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/screen_for_screen_shot.dart';
import 'package:edu_lens/view/widget/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:root/root.dart';

class HomeController extends GetxController {
  final services = GetHomeServices();
  final covers = <CoverModel>[].obs;
  final teachers = <TeacherModel>[].obs;
  final lecturePaid = <LecturePaidModel>[].obs;
  final studentReservations = <StudentReservationsModel>[].obs;
  final chapterPaid = <ChapterPaidModel>[].obs;
  final subject = <SubjectModel>[].obs;
  final studentProfile = <StudentModel>[].obs;
  final listYears = <ClassesModel>[].obs;
  final solvedExams = <SolvedExamsModel>[].obs;
  RxInt pageIndex = 0.obs;
  late RxString titleHome;
  late RxBool apiLoadingTeacher = false.obs, apiLoadingSubject = false.obs;
  final controllerSmoothPageIndicator =
      PageController(viewportFraction: 0.8, keepPage: true);
  final CarouselController controllerCarouselSlider = CarouselController();
  final loading = false.obs;
  RxList idListTeacherLove = [].obs;
  late PageController pageController;
  static const EventChannel record = EventChannel('samples.flutter.io/record');
  RxBool appleAndGoogleBool = false.obs;
  bool _status = false;

  @override
  Future<void> onInit() async {
    super.onInit();
    // TODO: implement onInit

    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    titleHome = ('homeTitle'.tr).obs;
    // Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    //   if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
    //     // reload here
    //   }
    // });
    // MyConnectivity _connectivity = MyConnectivity.instance;
    //
    // _connectivity.myStream.listen((source) {
    //   // _source = source;
    //   if (source.keys.toList()[0] == ConnectivityResult.none) {
    //     alertDialogWifi();
    //   }
    // });
    await refresherMethod();
    if (Platform.isIOS) {
      record.receiveBroadcastStream().listen(
            _onEvent,
          );
    }
    if (Platform.isAndroid) {
      checkRoot();
    }
  }

  checkRoot() {
    Future.delayed(const Duration(seconds: 2), () async {
      bool? result = await Root.isRooted();
      _status = result!;
      log("Root $_status");
      if (_status) {
        Get.dialog(DialogRootAndroid(),
            barrierDismissible: false, barrierColor: Colors.black);
      }
    });
    log("checkRoot");
  }

  void _onEvent(Object? event) {
    if (event as bool && !appleAndGoogleBool.value) {
      Get.offAll(() => const ScreenForScreenShot());
    }
    // setState(() {});
  }

  updateLecturePaid() async {
    try {
      lecturePaid.value = (await services.getLecturePaid())!;
    } catch (e) {
      debugPrint("${e.toString()} catch 109 home controller");
    }
    studentProfile.value = (await services.getDataUser())!;
  }

  updateChapterPaid() async {
    chapterPaid.value = (await services.getChapterPaid())!;
    studentProfile.value = (await services.getDataUser())!;
  }

  updateSolvedExams() async {
    solvedExams.value = (await services.getSolvedExams())!;
    studentProfile.value = (await services.getDataUser())!;
    solvedExams.refresh();
  }

  updateStudentReservations() async {
    studentReservations.value = (await services.getReservations())!;
    studentProfile.value = (await services.getDataUser())!;
  }

  checkAccountAppleORGoogle() {
    if (studentProfile[0].phone == "01122334455" ||
        studentProfile[0].phone == "01234567899") {
      appleAndGoogleBool.value = true;
      debugPrint("i am apple dev");
    }
  }

  getIdTeacherLoveFun() {
    List id = [];
    log("myList.toList().toString()");
    try {
      dynamic jsonData = jsonDecode(GetStorage().read("listTeacherLoves"));
      for (var element in List<TeacherModel>.from(
          jsonData.map((i) => TeacherModel.fromJson(i))).toList().obs) {
        try {
          // log("element: ${element.toJson()}");
          id.add(element.id);
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return id;
  }

  void changePage(index) {
    pageIndex.value = index;
    titleHome.value = AppConstants.listTitles[index];
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    pageIndex.refresh();
  }

  refresherMethod() async {
    //covers
    apiLoadingSubject.value = true;
    apiLoadingTeacher.value = true;

    try {
      covers.value = (await services.getCovers())!;
    } catch (e) {}

    //teachers
    try {
      teachers.value = (await services.getTeacherList())!;
      apiLoadingTeacher.value = false;
    } catch (e) {}
    // teachersLove.value = getTeacher;
    //subject
    try {
      subject.value = (await services.getSubjectList())!;
      apiLoadingSubject.value = false;
    } catch (e) {}
    //student data
    try {
      studentProfile.value = (await services.getDataUser())!;
    } catch (e) {}
    studentProfile.refresh();
    //list Years
    listYears.value = [
      ClassesModel(
          id: 1,
          name: "تعليم حر",
          gradeId: 1,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 2,
          name: "الفرقة الأولى",
          gradeId: 2,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 3,
          name: "الفرقة الثانية",
          gradeId: 2,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 4,
          name: "الفرقة الثالثة",
          gradeId: 2,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 5,
          name: "الفرقة الرابعة",
          gradeId: 2,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 6,
          name: "الفرقة الخامسة",
          gradeId: 2,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 7,
          name: "الفرقة السادسة",
          gradeId: 2,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 8,
          name: "الفرقة السابعة",
          gradeId: 2,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 9,
          name: "الصف الأول الإعدادي",
          gradeId: 3,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 10,
          name: "الصف الثاني الإعدادي",
          gradeId: 3,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 11,
          name: "الصف الثالث الإعدادي",
          gradeId: 3,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 12,
          name: "الصف الأول الثانوي",
          gradeId: 3,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 13,
          name: "الصف الثاني الثانوي",
          gradeId: 3,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 14,
          name: "الصف الثالث الثانوي",
          gradeId: 3,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z")
    ];
    //solved Exams
    try {
      solvedExams.value = (await services.getSolvedExams())!;
    } catch (e) {
      debugPrint(e.toString());
    }
    debugPrint(teachers.length.toString());
    try {
      idListTeacherLove.value = await getIdTeacherLoveFun();
    } catch (e) {}
    try {
      lecturePaid.value = (await services.getLecturePaid())!;
    } catch (e) {
      debugPrint(e.toString());
    }
    try {
      studentReservations.value = (await services.getReservations())!;
    } catch (e) {}
    try {
      chapterPaid.value = (await services.getChapterPaid())!;
    } catch (e) {}
    await checkAccountAppleORGoogle();
  }
}
