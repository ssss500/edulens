import 'package:edu_lens/controllers/login/register_controller.dart';
import 'package:edu_lens/view/login/mobile/create_account_for_college_student.dart';
import 'package:edu_lens/view/login/mobile/create_account_view.dart';
import 'package:edu_lens/view/login/mobile/login_view.dart';
import 'package:edu_lens/view/widget/custom_buttom.dart';
import 'package:edu_lens/view/widget/custom_buttom_deflated.dart';
import 'package:edu_lens/view/widget/custom_scaffold_login.dart';
import 'package:edu_lens/view/widget/custom_social_media_icons.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLogin extends StatelessWidget {
    HomeLogin({Key? key}) : super(key: key);
  RegisterController registerController=Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return CustomScaffoldLogin(
      screenHeight: screenHeight,
      screenWidth: screenWidth,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          //welcome text
          SizedBox(
            width: screenWidth*0.88,
            child: CustomText(
              text: "welcome".tr,
              fontSize: 34,
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          //create account button
          CustomButton(
            function: () {
              Get.to(
                  ()=> const CreateAccountView(),
              );
            },
            text: "createAccountText".tr,
          ),
          const SizedBox(
            height: 25,
          ),
          //login button
          CustomButtonDeflated(
            function: () {
              Get.to(()=>  LoginView());
            },
            text: "loginText".tr,
            height: 50,
            width: 250,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "areYouCollegeStudent".tr,
                color: Colors.black87,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(() =>   CreateAccountForCollegeStudent());
                  },
                  child: CustomText(
                    text: 'createAccountText'.tr,
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          const SizedBox(
            height:40,
          ),
          customSocialMediaIcons(),
          const SizedBox(
            height:40,
          ),
        ],
      ),
    );
  }
}
