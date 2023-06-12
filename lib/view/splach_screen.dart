import 'dart:async';
import 'package:edu_lens/controllers/login/switch_login.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/cashe_helper.dart';
import 'package:edu_lens/view/home/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  bool openImage = true;
fun() async {
  final token = await CacheHelper.getData(key: AppConstants.token);
// if (kDebugMode) {
//   print("");
// }
  Timer(const Duration(milliseconds:kDebugMode?1000:  3500), () {
    Get.offAll(() => SwitchLogin());
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
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
