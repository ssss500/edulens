import 'package:edu_lens/routes/routes_names.dart';
import 'package:edu_lens/view/widget/custom_registration_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/login/login_controller.dart';
import '../../../controllers/phone_number_formatter.dart';
import '../../../helper/app_constants.dart';
import '../../widget/custom_buttom.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_text_field_login.dart';
import '../../widget/socialmedia_icons_windows.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return CustomRegistrationView(
      widget: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: RotatedBox(
              quarterTurns: 2,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  children: [
                    CustomText(
                      text: 'welcomeLogin'.tr,
                      fontSize: width * 0.021,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                CustomText(text: 'phoneNumberText'.tr, fontSize: width * 0.012),
                SizedBox(
                  height: height * 0.01,
                ),
                CustomTextFieldLogin(
                  isMobile: false,
                  function: (v) {
                    controller.phone.value = v;
                  },
                  iconData: Icons.phone_rounded,
                  hint: "01010101010",
                  width: width * 0.183,
                  textInputType: TextInputType.phone,
                  colorBorder: AppConstants.primaryColor,
                  inputFormatters: [PhoneNumberFormatter()],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                CustomText(text: 'passwordText'.tr, fontSize: width * 0.012),
                SizedBox(
                  height: height * 0.01,
                ),
                CustomTextFieldLogin(
                  isMobile: false,
                  function: (v) {
                    controller.password.value = v;
                  },
                  width: width * 0.183,
                  iconData: Icons.lock,
                  hint: "*********",
                  textInputType: TextInputType.visiblePassword,
                  colorBorder: AppConstants.primaryColor,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Obx(
                  () => controller.loading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppConstants.lightPrimaryColor,
                          ),
                        )
                      : CustomButton(
                          function: () {
                            controller.loginForWindows(context);
                          },
                          text: 'loginText'.tr,
                          sizeText: width * 0.014,
                          height: height * 0.068,
                          width: width * 0.18,
                        ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'doNotHaveAnAccount'.tr,
                      color: Colors.black87,
                      fontSize: width * 0.01,
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(RoutesNames.register1);
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
                  height: height * 0.01,
                ),
                const SocialMediaIconsWindows(),
              ],
            ),
          ),
        ],
      ),
    buttonBack: false,
    );
  }
}
