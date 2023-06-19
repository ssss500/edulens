import 'package:edu_lens/responsive.dart';
import 'package:flutter/material.dart';

import '../mobile/home.dart';
import '../windows/home_screen.dart';

class HomeCommon extends StatelessWidget {
  const HomeCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: Home(), desktop: HomeScreen());
  }
}
