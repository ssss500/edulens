import 'package:edu_lens/view/login/windows/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/login/login_controller.dart';
import '../../../helper/app_constants.dart';
import '../../widget/custom_buttom.dart';
import '../../widget/custom_text.dart';
import '../../widget/input_component.dart';
import '../../widget/socialmedia_icons_windows.dart';
class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  final controller = Get.put(LoginController());

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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Text(
                          'أهلا بك مجددا معنا!',
                          style: TextStyle(
                            fontSize: width * 0.021,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          'phoneNumberText'.tr,
                          style: TextStyle(fontSize: width * 0.012),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        InputComponent(
                          textInputType: TextInputType.text,
                          function: (String v) {
                              controller.phone.value = v;
                          },
                          //inputFormatters: [PhoneNumberFormatter()],
                          icon: Icons.phone_rounded,
                          hint: '010010010010',
                          width: width*0.183,

                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          'passwordText'.tr,
                          style:  TextStyle(fontSize: width * 0.012),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        InputComponent(
                          textInputType: TextInputType.text,
                          function: (String v) {
                             controller.password.value = v;
                          },
                          icon: Icons.lock,
                          hint: '************',
                          width: width*0.183,
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
                          :
                        CustomButton(
                          function: () {
                            controller.loginForWindows(context);
                          },
                          text: 'تسجيل دخول',
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
                              text: 'ليس لديك حساب ؟    ',
                              color: Colors.black87,
                              fontSize: width * 0.01,
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(() => const RegisterScreen());
                                },
                                child: CustomText(
                                  text: 'انشاء حساب',
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
