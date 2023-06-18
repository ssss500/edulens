import 'package:edu_lens/controllers/login/switch_login.dart';
import 'package:edu_lens/controllers/message_controller.dart';
import 'package:edu_lens/routes/routes_names.dart';
import 'package:edu_lens/view/get_started_screen.dart';
import 'package:edu_lens/view/home/windows/home_screen.dart';
import 'package:edu_lens/view/home/windows/messages_screen.dart';
import 'package:edu_lens/view/home/windows/paid_lectures.dart';
import 'package:edu_lens/view/login/mobile/home_login_view.dart';
import 'package:edu_lens/view/login/windows/login_screen.dart';
import 'package:edu_lens/view/login/windows/regieter_three_screen.dart';
import 'package:edu_lens/view/login/windows/register_one_college_screen.dart';
import 'package:edu_lens/view/login/windows/register_screen.dart';
import 'package:edu_lens/view/login/windows/register_three_college_screen.dart';
import 'package:edu_lens/view/login/windows/register_two_college_screen.dart';
import 'package:edu_lens/view/login/windows/register_two_screen.dart';
import 'package:edu_lens/view/root_screen.dart';
import 'package:edu_lens/view/splash.dart';
import 'package:get/get.dart';

import '../binding/view_model_binding.dart';
import '../view/home/mobile/home.dart';

class Routes {

  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: RoutesNames.root,
      page: () => const RootScreen(
      ),),
    GetPage(
        name: RoutesNames.splash,
        page: () => const Splash(
            ),),
    GetPage(name: RoutesNames.startWindows, page: () => const GetStartedScreen()),
    GetPage(name: RoutesNames.startMobile, page:()=> HomeLogin()),
    GetPage(name:  RoutesNames.login, page: () => LoginScreen()),
    GetPage(name:  RoutesNames.register1, page: () => const RegisterScreen()),
    GetPage(name: RoutesNames.register2, page: () => RegisterTwoScreen()),
    GetPage(name: RoutesNames.register3, page: () => RegisterThreeScreen()),
    GetPage(name: RoutesNames.registerUni1, page: () => RegisterOneCollegeScreen()),
    GetPage(name: RoutesNames.registerUni2, page: () => RegisterTwoCollegeScreen()),
    GetPage(name: RoutesNames.registerUni3, page: () => RegisterThreeCollegeScreen()),
    GetPage(name: RoutesNames.home, page: () =>  HomeScreen()),
    GetPage(name: RoutesNames.homeMobile, page: () =>  Home()),
    GetPage(name:RoutesNames.message, page: () =>  MessageScreen(), binding: ViewModelBinding()),
    GetPage(name: RoutesNames.switchLogin, page: ()=> const SwitchLogin(),),
    GetPage(name: RoutesNames.paidLecture, page: () =>  PaidLectureScreen()),

  ];
}
