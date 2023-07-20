import 'package:edu_lens/view/splash/splash_mobile.dart';
import 'package:edu_lens/view/splash/splash_windows.dart';
import 'package:flutter/material.dart';

import '../../responsive.dart';

class SplashCommon extends StatelessWidget {
  const SplashCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(mobile: SplashMobile(), desktop: SplashWindows());
  }
}
