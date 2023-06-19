import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'next_button.dart';
class CustomRegistrationView extends StatelessWidget {
    CustomRegistrationView({Key? key, required this.widget,  this.funNextButton,this.buttonBack=true}) : super(key: key);
  final Widget widget;
  final Function? funNextButton;
  final bool buttonBack;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.fill,
            width: width,
            height: height,
          ),
          Center(
            child: Container(
              width: width / 1.2,
              height: height / 1.2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.00),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    right: width * 0.065,
                    top: height * 0.065,
                    left: width * 0.03,
                    bottom: height * 0.065),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      widget,
                      if(buttonBack)
                      SizedBox(
                        height: height * 0.03,
                      ),
                      if(buttonBack)
                        Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RotatedBox(
                                quarterTurns: 2,
                                child: NextButton(
                                    function:(){
                                      funNextButton!();
                                    },
                                    icon: Icons.arrow_back_ios_new_outlined),
                              ),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              NextButton(
                                  function: () {
                                    Get.back();
                                  },
                                  icon: Icons.arrow_back_ios_new_outlined),
                            ],
                          ),
                        )
                    ],
                  ),
                    if(width > 800)
                      Image.asset(
                      'assets/images/logo4.png',
                      width: width * 0.4,
                      height: height,
                    )

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
