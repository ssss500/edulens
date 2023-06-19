import 'package:edu_lens/responsive.dart';
import 'package:flutter/material.dart';

import '../mobile/home_menu_mobile.dart';
import '../windows/home_menu_scren_windows.dart';

class HomeCommon extends StatelessWidget {
  const HomeCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: HomeMenuMobile(), desktop: HomeMenuScreenWindows());
  }
}
