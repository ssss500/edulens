import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/controllers/login/login_controller.dart';
import 'package:edu_lens/controllers/login/register_controller.dart';
import 'package:edu_lens/controllers/login/switch_login.dart';
import 'package:edu_lens/controllers/message_controller.dart';
import 'package:edu_lens/routes/routes_names.dart';
import 'package:edu_lens/view/login/common_view/login_view_common.dart';
import 'package:edu_lens/view/login/windows/get_started_screen.dart';
import 'package:edu_lens/view/home/windows/home_menu_scren_windows.dart';
import 'package:edu_lens/view/home/windows/messages_screen.dart';
import 'package:edu_lens/view/home/windows/paid_lectures.dart';
import 'package:edu_lens/view/login/mobile/home_login_view.dart';
import 'package:edu_lens/view/login/windows/login_screen.dart';
import 'package:edu_lens/view/login/windows/regester_student/regieter_three_screen.dart';
import 'package:edu_lens/view/login/windows/register_college/register_one_college_screen.dart';
import 'package:edu_lens/view/login/windows/regester_student/register_screen.dart';
import 'package:edu_lens/view/login/windows/register_college/register_three_college_screen.dart';
import 'package:edu_lens/view/login/windows/register_college/register_two_college_screen.dart';
import 'package:edu_lens/view/login/windows/regester_student/register_two_screen.dart';
import 'package:edu_lens/view/splash.dart';
import 'package:get/get.dart';

import '../binding/view_model_binding.dart';
import '../view/home/common_view/home_common.dart';
import '../view/home/mobile/home_menu_mobile.dart';
import '../view/login/common_view/register_common.dart';
import '../view/login/common_view/register_tow_common.dart';
import '../view/login/common_view/welcom_view_common.dart';

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
      page: () => RegisterThreeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RegisterController>(
          () => RegisterController(),
        );
      }),
    ),
    GetPage(
      name: RoutesNames.registerUni1,
      page: () => RegisterOneCollegeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RegisterController>(
          () => RegisterController(),
        );
      }),
    ),
    GetPage(
      name: RoutesNames.registerUni2,
      page: () => RegisterTwoCollegeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RegisterController>(
          () => RegisterController(),
        );
      }),
    ),
    GetPage(
      name: RoutesNames.registerUni3,
      page: () => RegisterThreeCollegeScreen(),
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
      page: () => MessageScreen(),
      binding: BindingsBuilder(() {

      }),
    ),

    GetPage(
      name: RoutesNames.paidLecture,
      page: () => PaidLectureScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(
              () => HomeController(),
        );
      }),
    ),
  ];
}
