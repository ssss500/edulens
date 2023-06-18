import 'package:edu_lens/view/login/windows/login_screen.dart';
import 'package:edu_lens/view/widget/custom_registration_view.dart';
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

    return CustomRegistrationView(widget:   Padding(
      padding: EdgeInsets.only(top: height * 0.065),
      child: SingleChildScrollView(
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
                Get.toNamed('/register');
              },
              text: 'انشاء حساب',
              sizeText: width * 0.014,
              height: height * 0.068,
              width: width * 0.18,
            ),
            SizedBox(
              height: height * 0.04,
            ),
            //login button
            CustomButtonDeflated(
              function: () {
                Get.toNamed('/login');
              },
              text: "تسجيل دخول",
              fontSize: width * 0.014,
              height: height * 0.068,
              width: width * 0.18,
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
                  fontSize: width * 0.01,
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed('/registerUni1');
                    },
                    child: CustomText(
                      text: 'createAccountText'.tr,
                      fontSize: width * 0.011,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
            SizedBox(
              height: height * 0.04,
            ),
            const SocialMediaIconsWindows(),
          ],
        ),
      ),
    ),);
  }
}
