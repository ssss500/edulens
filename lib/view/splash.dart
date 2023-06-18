import 'dart:async';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/cashe_helper.dart';
import 'package:edu_lens/view/get_started_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({
    super.key,
  });

  //    height: MediaQuery.of(context).size.height,
  //         width: MediaQuery.of(context).size.width,
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  bool openImage = true;

  fun() async {
    //final token = await CacheHelper.getData(key: AppConstants.token);
// if (kDebugMode) {
//   print("");
// }

    Timer(const Duration(milliseconds: kDebugMode ? 1000 : 3500), () {
      if (MediaQuery.of(context).size.width >= 800) {
        if (CacheHelper.getData(key: AppConstants.token) == null) {
          Get.offAllNamed("start");
        } else {
          Get.offAllNamed("home");
        }
      } else  {
        if (CacheHelper.getData(key: AppConstants.token) == null) {
          Get.offAllNamed("startMobile");
        } else {
          Get.offAllNamed("homeMobile");
        }
      }
    });
  }

  @override
  void initState() {
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
          fit: MediaQuery.of(context).size.width >= 800
              ? BoxFit.fill
              : BoxFit.fitHeight,
        ),
      ),
    );
  }
}
