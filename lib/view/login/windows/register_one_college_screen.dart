import 'dart:io';

import 'package:edu_lens/view/login/windows/register_two_college_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../../../controllers/login/register_controller.dart';
import '../../widget/custom_dialog/snackBar.dart';
import '../../widget/input_component.dart';
import '../../widget/next_button.dart';

class RegisterOneCollegeScreen extends StatelessWidget {
  RegisterOneCollegeScreen({Key? key}) : super(key: key);
  RegisterController controller = Get.put(RegisterController());

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
                    top: height * 0.03,
                    left: width * 0.03,
                    bottom: height * 0.065),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                      key: controller.formWindowsUniOne,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Text(
                            'انضم الي ايديو لينس الأن!',
                            style: TextStyle(
                              fontSize: width * 0.018,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'الاسم الاول',
                                    style: TextStyle(fontSize: width * 0.012),
                                  ),
                                  SizedBox(
                                    height: height * 0.005,
                                  ),
                                  InputComponent(
                                    textInputType: TextInputType.text,
                                    function: (String v) {
                                      controller.firstName.value = v;
                                    },
                                    width: width * 0.085,
                                    //inputFormatters: [PhoneNumberFormatter()],
                                    icon: Icons.person,
                                    hint: 'احمد',
                                    validator: (value) {
                                      if (value.length < 3) {
                                        showCustomSnackBar(
                                            context: context,
                                            title: "note".tr,
                                            deck:
                                                "يجب كتابة اسم الطالب بشكل صحيح",
                                            contentType: ContentType.failure);
                                        return "";
                                      }
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: width * 0.009,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'الاسم الاخير',
                                    style: TextStyle(fontSize: width * 0.012),
                                  ),
                                  SizedBox(
                                    height: height * 0.005,
                                  ),
                                  InputComponent(
                                    textInputType: TextInputType.text,
                                    function: (String v) {
                                      controller.lastName.value = v;
                                    },
                                    validator: (value) {
                                      if (value.length < 3) {
                                        showCustomSnackBar(
                                            context: context,
                                            title: "note".tr,
                                            deck:
                                                "يجب كتابة الاسم الاخير بشكل صحيح",
                                            contentType: ContentType.failure);
                                        return "";
                                      }
                                    },
                                    width: width * 0.085,
                                    //inputFormatters: [PhoneNumberFormatter()],
                                    icon: Icons.person,
                                    hint: 'محمد',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            'phoneNumberText'.tr,
                            style: TextStyle(fontSize: width * 0.012),
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          InputComponent(
                            textInputType: TextInputType.phone,
                            function: (String v) {
                              controller.phone.value = v;
                            },
                            //inputFormatters: [PhoneNumberFormatter()],
                            icon: Icons.phone,
                            hint: '010010010010', width: width * 0.183,
                            validator: (value) {
                              if (value.length != 11) {
                                showCustomSnackBar(
                                    context: context,
                                    title: "note".tr,
                                    deck: "يجب كتابة رقم الهاتف بشكل صحيح",
                                    contentType: ContentType.failure);
                                return "";
                              }
                            },
                          ),
                          Text(
                            'passwordText'.tr,
                            style: TextStyle(fontSize: width * 0.012),
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          InputComponent(
                            textInputType: TextInputType.visiblePassword,
                            function: (String v) {
                              controller.password.value = v;
                            },
                            //inputFormatters: [PhoneNumberFormatter()],
                            icon: Icons.lock,
                            hint: '**********', width: width * 0.183,
                            validator: (value) {
                              if (value.length < 5) {
                                showCustomSnackBar(
                                    context: context,
                                    title: "note".tr,
                                    deck: "يجب كتابة كلمة المرور بشكل صحيح",
                                    contentType: ContentType.failure);
                                return "";
                              }
                            },
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          Text(
                            'confirmationPasswordText'.tr,
                            style: TextStyle(fontSize: width * 0.012),
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          InputComponent(
                            textInputType: TextInputType.visiblePassword,
                            function: (String v) {
                              controller.password2.value = v;
                            },
                            icon: Icons.lock,
                            hint: '**********', width: width * 0.183,
                            validator: (value) {
                              if (controller.password2.value !=
                                  controller.password.value) {
                                showCustomSnackBar(
                                    context: context,
                                    title: "note".tr,
                                    deck: "يجب ان تكون كلمة المرور متطابقة",
                                    contentType: ContentType.failure);
                                return "";
                              }
                            },
                            // hintSize: 26,
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),

                          SizedBox(
                            height: height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: width * 0.07),
                            child: RotatedBox(
                                quarterTurns: 2,
                                child: NextButton(
                                    function: () {
                                      if (controller.formWindowsUniOne.currentState!.validate()) {
                                        Get.to(() =>  RegisterTwoCollegeScreen());
                                      }
                                    },
                                    icon: Icons.arrow_back_ios_new_outlined)),
                          )
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
