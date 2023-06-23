import 'package:edu_lens/view/widget/proste_bezier_curve.dart';
import 'package:flutter/material.dart';

import 'custom_social_media_icons.dart';

class CustomScaffoldLogin extends StatelessWidget {
  CustomScaffoldLogin(
      {super.key, required this.widget,
      required this.screenHeight,
      required this.screenWidth});

  double screenHeight, screenWidth;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        height: screenHeight,
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Wavy line
                CustomLoginBezierCurve(screenWidth),

                /// Wavy line bottom

                RotationTransition(
                    turns: const AlwaysStoppedAnimation(180 / 360),
                    child: CustomLoginBezierCurve(screenWidth)),
              ],
            ),
//logo edu lens
            Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:   EdgeInsets.only(
                          top: (screenHeight * 0.23),),
                      child: Container(
                        padding: const EdgeInsets.only(right: 20),
                        child: Image.asset(
                          'assets/images/logo-edu-lens.png',
                          width: screenHeight * 0.3,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // welcome text
                    widget,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
