import 'package:edu_lens/responsive.dart';
import 'package:edu_lens/view/login/mobile/home_login_view.dart';
import 'package:flutter/material.dart';

import '../windows/get_started_screen.dart';

class WelcomeViewCommon extends StatelessWidget {
  const WelcomeViewCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: HomeLogin(), desktop: GetStartedScreen());
  }
}
