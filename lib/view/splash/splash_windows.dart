import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../helper/app_constants.dart';
import '../../helper/cashe_helper.dart';
import '../../routes/routes_names.dart';
import '../login/windows/get_started_screen.dart';

class SplashWindows extends StatefulWidget {
  const SplashWindows({Key? key}) : super(key: key);

  @override
  State<SplashWindows> createState() => _SplashWindowsState();
}

class _SplashWindowsState extends State<SplashWindows> {
  @override
  void initState() {
    super.initState();
    navigateDelay(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
            'assets/images/bg.png',
          fit: BoxFit.fill,
          width:  MediaQuery
              .sizeOf(context)
              .width ,
          height: MediaQuery
              .sizeOf(context)
              .height,),
        Align(
          child:
          Image.asset(
            'assets/images/logo4.png',
            width: MediaQuery
                .sizeOf(context)
                .width / 1,
            height: MediaQuery
                .sizeOf(context)
                .height / 1.5,
            // fit: BoxFit.fill,
          ),

        ),
      ],
    );
  }

  void navigateDelay(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if (CacheHelper.getData(key: AppConstants.token) == null) {
        Get.offAllNamed(RoutesNames.welcomeScreen);
      } else {
        Get.offAllNamed(RoutesNames.home);
      }
    });
  }
}

