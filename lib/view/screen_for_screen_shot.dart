

import 'dart:io';

import 'package:edu_lens/view/widget/custom_app_bar.dart';
import 'package:edu_lens/view/widget/custom_buttom.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ScreenForScreenShot extends StatelessWidget {
  const ScreenForScreenShot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'شوفتك',
      bakeButtonBool: false,
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:  ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child:
              Image.asset(
                'assets/images/screenshoti.png',
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: CustomText(
              text: 'شوفتك يا اللي بتسجل الشاشة و هجيبك👀👀',
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            function: () async {
              Platform.isAndroid ? SystemNavigator.pop() : exit(0);
            },
            text: 'الخروج من البرنامج',
          )
        ],
      ),
    );
  }
}
