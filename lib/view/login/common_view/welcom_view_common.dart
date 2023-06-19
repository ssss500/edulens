import 'package:edu_lens/responsive.dart';
import 'package:edu_lens/view/login/mobile/home_login_view.dart';
import 'package:flutter/material.dart';

import '../home/windows/home_screen.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: HomeLogin(), desktop: HomeScreen());
  }
}
