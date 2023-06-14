import 'package:edu_lens/view/get_started_screen.dart';
import 'package:edu_lens/view/splash.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';
class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //  AppSetting.init(context);

    return const  Responsive(
      mobile: Splash(fit: BoxFit.fill,),
      desktop:  Splash(fit: BoxFit.fitHeight,),
    );
  }
}