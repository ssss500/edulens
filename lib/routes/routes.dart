import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/controllers/login/login_controller.dart';
import 'package:edu_lens/controllers/login/register_controller.dart';
import 'package:edu_lens/controllers/message_controller.dart';
import 'package:edu_lens/routes/routes_names.dart';
import 'package:edu_lens/view/login/common_view/login_view_common.dart';
import 'package:edu_lens/view/home/windows/messages_screen.dart';
import 'package:edu_lens/view/home/windows/paid_lectures.dart';
import 'package:edu_lens/view/login/windows/regester_student/regieter_three_screen.dart';
import 'package:edu_lens/view/login/windows/register_college/register_one_college_screen.dart';
import 'package:edu_lens/view/login/windows/register_college/register_three_college_screen.dart';
import 'package:edu_lens/view/login/windows/register_college/register_two_college_screen.dart';
import 'package:edu_lens/view/package_teacher/choose_teacher_for_package.dart';
import 'package:edu_lens/view/package_teacher/packages_view.dart';
import 'package:edu_lens/view/pdf_view.dart';
import 'package:edu_lens/view/splash.dart';
import 'package:edu_lens/view/who_we_are_view.dart';
import 'package:edu_lens/view/widget/custom_image_url_view.dart';
import 'package:get/get.dart';
import '../controllers/home_courses_controller.dart';
import '../controllers/package_controller.dart';
import '../controllers/pdf_controller.dart';
import '../controllers/profile_teacher_controller.dart';
import '../controllers/quiz/question_controller.dart';
import '../controllers/quiz/question_month_controller.dart';
import '../controllers/subject_teacher_controller.dart';
import '../controllers/video_controller.dart';
import '../view/home/common_view/home_common.dart';
import '../view/home/mobile/subject_teacher_view.dart';
import '../view/home/windows/teacher_profile.dart';
import '../view/home_courses_view.dart';
import '../view/login/common_view/register_common.dart';
import '../view/login/common_view/register_tow_common.dart';
import '../view/login/common_view/welcom_view_common.dart';
import '../view/login/mobile/create_account_view.dart';
import '../view/message_view.dart';
import '../view/profile_teacher_view.dart';
import '../view/purchasedLectures.dart';
import '../view/quiz/answer_quiz_month_view.dart';
import '../view/quiz/answer_quiz_view.dart';
import '../view/quiz/question_month_view.dart';
import '../view/quiz/question_view.dart';
import '../view/video/video_view.dart';

class Routes {
  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: RoutesNames.splash,
      page: () => const Splash(),
    ),
    GetPage(
      name: RoutesNames.welcomeScreen,
      page: () => const WelcomeViewCommon(),
    ),
    GetPage(
      name: RoutesNames.login,
      page: () => const LoginViewCommon(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(
          () => LoginController(),
        );
      }),
    ),
    GetPage(
      name: RoutesNames.register1,
      page: () => const RegisterCommon(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RegisterController>(
          () => RegisterController(),
        );
      }),
    ),
    GetPage(
      name: RoutesNames.register2,
      page: () => const RegisterTwoCommon(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RegisterController>(
          () => RegisterController(),
        );
      }),
    ),
    GetPage(
      name: RoutesNames.register3,
      page: () => const RegisterThreeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RegisterController>(
          () => RegisterController(),
        );
      }),
    ),
    GetPage(
      name: RoutesNames.registerUni1,
      page: () => const RegisterOneCollegeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RegisterController>(
          () => RegisterController(),
        );
      }),
    ),
    GetPage(
      name: RoutesNames.registerUni2,
      page: () => const RegisterTwoCollegeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RegisterController>(
          () => RegisterController(),
        );
      }),
    ),
    GetPage(
      name: RoutesNames.registerUni3,
      page: () => const RegisterThreeCollegeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RegisterController>(
          () => RegisterController(),
        );
      }),
    ),

    ///home
    GetPage(
      name: RoutesNames.home,
      page: () => const HomeCommon(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(
          () => HomeController(),
        );
        Get.lazyPut<MessageController>(
          () => MessageController(),
        );


      }),
    ),

    GetPage(
      name: RoutesNames.message,
      page: () => const MessageScreen(),
      binding: BindingsBuilder(() {}),
    ),

    GetPage(
      name: RoutesNames.paidLecture,
      page: () =>  const PaidLectureScreen(),

    ),
    GetPage(
      name: RoutesNames.videoView,
      page: () => VideoView(),
        bindings: [
          BindingsBuilder(() {
            Get.lazyPut<VideoController>(
                  () => VideoController(),
            );
          }),
          BindingsBuilder(() {
            Get.lazyPut<HomeController>(
                  () => HomeController(),
            );
          }),
          BindingsBuilder(() { Get.lazyPut<HomeCoursesController>(() => HomeCoursesController());})
        ]
    ),
    GetPage(
        name: RoutesNames.coursesFromHome,
        page: () => const HomeCoursesView(),
        bindings: [
          BindingsBuilder(() {
            Get.lazyPut<HomeCoursesController>(
              () => HomeCoursesController(),
            );
          }),
          BindingsBuilder(() {
            Get.lazyPut<HomeController>(
              () => HomeController(),
            );
          }),
        ]),

    GetPage(
        name: RoutesNames.chooseTeacherForPackages,
        page: () => ChooseTeacherForPackages(),
        bindings: [
          BindingsBuilder(() {
            Get.lazyPut<HomeCoursesController>(
              () => HomeCoursesController(),
            );
          }),
          BindingsBuilder(() {
            Get.lazyPut<PackageController>(
              () => PackageController(),
            );
          }),
        ]),

    GetPage(
      name: RoutesNames.createAccountView,
      page: () => const CreateAccountView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RegisterController>(
          () => RegisterController(),
        );
      }),
    ),

    GetPage(
      name: RoutesNames.subjectView,
      page: () => const SubjectTeacher(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SubjectTeacherController>(
          () => SubjectTeacherController(),
        );
      }),
    ),

    GetPage(
        name: RoutesNames.teacherView,
        page: () => const TeacherProfile(),
        bindings: [
          BindingsBuilder(() {
            Get.lazyPut<ProfileTeacherController>(
              () => ProfileTeacherController(),
            );
          }),
          BindingsBuilder(() {
            Get.lazyPut<HomeController>(
              () => HomeController(),
            );
          }),
        ]),
    GetPage(
        name: RoutesNames.profileTeacherView,
        page: () => const ProfileTeacherView(),
        bindings: [
          BindingsBuilder(() {
            Get.lazyPut<ProfileTeacherController>(
              () => ProfileTeacherController(),
            );
          }),
          BindingsBuilder(() {
            Get.lazyPut<HomeController>(
              () => HomeController(),
            );
          }),
          BindingsBuilder(() {
            Get.lazyPut<QuestionMonthController>(
              () => QuestionMonthController(),
            );
          }),
        ]),

    GetPage(
      name: RoutesNames.purchasedLecture,
      page: () => const PurchasedLectures(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(
          () => HomeController(),
        );
      }),
    ),

    GetPage(
      name: RoutesNames.packageView,
      page: () => const PackagesView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<PackageController>(
          () => PackageController(),
        );
      }),
    ),
    GetPage(
      name: RoutesNames.howWeAre,
      page: () => const HowWeAreView(),
    ),
    GetPage(
      name: RoutesNames.subjectTeacher,
      page: () => const SubjectTeacher(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SubjectTeacherController>(
          () => SubjectTeacherController(),
        );
      }),
    ),
    GetPage(
      name: RoutesNames.messageView,
      page: () => const MessageView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<MessageController>(
          () => MessageController(),
        );
      }),
    ),

    GetPage(
        name: RoutesNames.qMonthView,
        page: () => QuestionMonthView(),
        bindings: [
          BindingsBuilder(() {
            Get.lazyPut<QuestionMonthController>(
                  () => QuestionMonthController(),
            );
          }),
          BindingsBuilder(() {
            Get.lazyPut<ProfileTeacherController>(
                  () => ProfileTeacherController(),
            );
          }),
        ]),
    GetPage(
      name: RoutesNames.answerQuizMonthView,
      page: () => const AnswerQuizMonthView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<QuestionMonthController>(
              () => QuestionMonthController(),
        );
      }),
    ),
    GetPage(
      name: RoutesNames.pdfView,
      page: () => PdfView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<PDFController>(
              () => PDFController(),
        );
      }),
    ),
    GetPage(
      name: RoutesNames.questionView,
      page: () => QuestionView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<QuestionController>(
              () => QuestionController(),
        );
      }),
    ),

    GetPage(
      name: RoutesNames.zoomImageView,
      page: () => const ZoomImageView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<QuestionController>(
              () => QuestionController(),
        );
      }),
    ),
    GetPage(
      name: RoutesNames.answerQuizView,
      page: () =>  const AnswerQuizView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<QuestionController>(
              () => QuestionController(),
        );
      }),
    ),
  ];
}
