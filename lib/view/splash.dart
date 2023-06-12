import 'dart:async';

import 'package:edu_lens/view/get_started_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../helper/app_constants.dart';
import '../helper/cashe_helper.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool openImage = true;
  fun() async {
    //final token = await CacheHelper.getData(key: AppConstants.token);
// if (kDebugMode) {
//   print("");
// }
    Timer(const  Duration(milliseconds:kDebugMode?1000:  3500), () {
      Get.offAll(() => GetStartedScreen());
      // Get.offAll(() => token == null ? const LoginView() : Home());
    });
  }
  @override
  void initState()   {
    super.initState();
    fun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Image.asset(
          "assets/images/splach_screen.gif",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
