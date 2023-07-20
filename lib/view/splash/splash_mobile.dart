import 'dart:async';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/cashe_helper.dart';
  import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes_names.dart';

class SplashMobile extends StatefulWidget {
  const SplashMobile({
    super.key,
  });

  @override
  SplashMobileState createState() => SplashMobileState();
}

class SplashMobileState extends State<SplashMobile> {

  fun() async {
    Timer(const Duration(milliseconds: kDebugMode ? 1000 : 3500), () {
      if (CacheHelper.getData(key: AppConstants.token) == null) {
        Get.offAllNamed(RoutesNames.welcomeScreen);
      } else {
        Get.offAllNamed(RoutesNames.home);
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
