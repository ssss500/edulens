import 'package:edu_lens/view/get_started_screen.dart';
import 'package:edu_lens/view/home/windows/home_screen.dart';
import 'package:edu_lens/view/login/windows/login_screen.dart';
import 'package:edu_lens/view/login/windows/regieter_three_screen.dart';
import 'package:edu_lens/view/login/windows/register_one_college_screen.dart';
import 'package:edu_lens/view/login/windows/register_screen.dart';
import 'package:edu_lens/view/login/windows/register_three_college_screen.dart';
import 'package:edu_lens/view/login/windows/register_two_college_screen.dart';
import 'package:edu_lens/view/login/windows/register_two_screen.dart';
import 'package:edu_lens/view/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage<dynamic>> pages = [
    GetPage(
        name: '/splashMobile',
        page: () => const Splash(
              fit: BoxFit.fitHeight,
            ),),
    GetPage(
        name: '/splashWindows',
        page: () => const Splash(
              fit: BoxFit.fill,
            ),),
    GetPage(name: '/start', page: () => const GetStartedScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/register1', page: () => const RegisterScreen()),
    GetPage(name: '/register2', page: () => RegisterTwoScreen()),
    GetPage(name: '/register3', page: () => RegisterThreeScreen()),
    GetPage(name: '/registerUni1', page: () => RegisterOneCollegeScreen()),
    GetPage(name: '/registerUni2', page: () => RegisterTwoCollegeScreen()),
    GetPage(name: '/registerUni3', page: () => RegisterThreeCollegeScreen()),
    GetPage(name: '/home', page: () => const HomeScreen()),
  ];
}
