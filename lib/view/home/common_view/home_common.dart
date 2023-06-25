import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../mobile/home_menu_mobile.dart';
import '../windows/home_menu_scren_windows.dart';

class HomeCommon extends GetView<HomeController> {
  const HomeCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(HomeController());
    return const Responsive(mobile: HomeMenuMobile(), desktop: HomeMenuScreenWindows());
  }
}
