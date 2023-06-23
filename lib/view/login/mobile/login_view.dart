import 'package:edu_lens/controllers/login/login_controller.dart';
import 'package:edu_lens/controllers/phone_number_formatter.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/login/mobile/create_account_view.dart';
import 'package:edu_lens/view/widget/custom_buttom.dart';
import 'package:edu_lens/view/widget/custom_scaffold_login.dart';
import 'package:edu_lens/view/widget/custom_social_media_icons.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:edu_lens/view/widget/custom_text_field_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes_names.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return CustomScaffoldLogin(
      screenHeight: screenHeight,
      screenWidth: screenWidth,
      widget: Column(
        children:  <Widget>[
          //text field phone number
          CustomTextFieldLogin(
            function: (v) {
              controller.phone.value = v;
            },
            iconData: Icons.phone,
            title: 'phoneNumberText'.tr,
            hint: "01010101010",
            textInputType: TextInputType.phone,
            colorBorder: AppConstants.primaryColor,
            inputFormatters: [PhoneNumberFormatter()],
          ),
          // text field password
          CustomTextFieldLogin(
            function: (v) {
              controller.password.value = v;
            },
            iconData: Icons.lock,
            title: 'passwordText'.tr,
            hint: "*********",
            colorBorder: AppConstants.primaryColor,
          ),
          const SizedBox(
            height: 20,
          ),
          //login button
          Obx(() => controller.loading.value
              ? const Center(
                  child: CircularProgressIndicator(color: AppConstants.lightPrimaryColor,),
                )
              : CustomButton(
                  function: () {
                    controller.login(context);
                    debugPrint("go to SwitchLogin");
                    // Get.offAll(SwitchLogin());
                  },
                  text: "loginText".tr,
                  sizeText: 18,
                  height: 50,
                  width: 250,
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: 'doYouHaveAnAccount'.tr,
                color: Colors.black45,
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(RoutesNames.createAccountView);
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
            height: 20,
          ),
          customSocialMediaIcons(),
          const SizedBox(
            height: 90,
          ),
        ],
      ),
    );
  }
}
