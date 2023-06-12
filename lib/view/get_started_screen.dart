import 'package:edu_lens/view/login/windows/login_screen.dart';
import 'package:edu_lens/view/widget/socialmedia_icons_windows.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login/windows/register_one_college_screen.dart';
import 'login/windows/register_screen.dart';
import 'widget/custom_buttom.dart';
import 'widget/custom_buttom_deflated.dart';
import 'widget/custom_text.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

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
            child:
                Container(
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
                   padding: EdgeInsets.only(right: width * 0.065, top : height *0.065, left: width*0.03, bottom:  height*0.065),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top:height *0.065 ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: height * 0.04,
                              ),
                              Text(
                                'مرحبا بكم في ايديو لينس',
                                style: TextStyle(fontSize: width * 0.021),
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              CustomButton(
                                function: () {
                                  Get.to(()=>const RegisterScreen());

                                },
                                text: 'انشاء حساب',
                                sizeText: width * 0.014,
                                height: height * 0.068,
                                width: width*0.18,
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              //login button
                              CustomButtonDeflated(
                                function: () {
                                  Get.to(()=> LoginScreen());
                                },
                                text: "تسجيل دخول",
                                fontSize: width * 0.014,
                                height: height * 0.068,
                                width: width*0.18,
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: "areYouCollegeStudent".tr,
                                    color: Colors.black87,
                                    fontSize: width*0.01,
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Get.to(()=>  RegisterOneCollegeScreen());
                                      },
                                      child: CustomText(
                                        text: 'createAccountText'.tr,
                                        fontSize: width*0.011,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                               SizedBox(
                                height: height*0.04,
                              ),
                            const  SocialMediaIconsWindows(),
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/images/logo4.png',
                          width: width * 0.4,
                          height: height,
                        ),
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
