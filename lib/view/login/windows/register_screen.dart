import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import 'package:edu_lens/view/login/windows/register_two_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/login/register_controller.dart';
import '../../../helper/app_constants.dart';
import '../../widget/custom_dialog/snackBar.dart';
import '../../widget/input_component.dart';
import '../../widget/next_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final controller = Get.put(RegisterController());

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
                      key:controller.formWindowsOne,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Text(
                            'انضم الي ايديو لينس الأن!',
                            style: TextStyle(
                              fontSize: width * 0.02,
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
                                width: width * 0.0123,
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
                                    width: width * 0.085,
                                    //inputFormatters: [PhoneNumberFormatter()],
                                    icon: Icons.person,
                                    hint: 'محمد',
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
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            'اسم ولي الأمر',
                            style: TextStyle(fontSize: width * 0.012),
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          InputComponent(
                            textInputType: TextInputType.text,
                            function: (String v) {
                              controller.parentName.value = v;
                            },
                            //inputFormatters: [PhoneNumberFormatter()],
                            icon: Icons.person,
                            hint: 'محمد عبدالله', width: width * 0.183,
                            validator: (value) {
                              if (value.length < 3) {
                                showCustomSnackBar(
                                    context: context,
                                    title: "note".tr,
                                    deck: "يجب كتابة اسم ولي الامر بشكل صحيح",
                                    contentType: ContentType.failure);
                                return "";
                              }
                            },
                          ),
                          Text(
                            'phoneNumberText'.tr,
                            style: TextStyle(fontSize: width * 0.012),
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          InputComponent(
                            textInputType: TextInputType.text,
                            function: (String v) {
                              controller.phone.value = v;
                            },
                            //inputFormatters: [PhoneNumberFormatter()],
                            icon: Icons.phone_rounded,
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
                          SizedBox(
                            height: height * 0.005,
                          ),
                          Text(
                            'dadPhoneNumberText'.tr,
                            style: TextStyle(fontSize: width * 0.012),
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          InputComponent(
                            textInputType: TextInputType.text,
                            function: (String v) {
                              controller.parentPhone.value = v;
                            },
                            icon: Icons.phone_rounded,
                            hint: '010010010010', width: width * 0.183,
                            validator: (value) {
                              if (value.length != 11) {
                                showCustomSnackBar(
                                    context: context,
                                    title: "note".tr,
                                    deck: "يجب كتابة رقم ولي الامر بشكل صحيح",
                                    contentType: ContentType.failure);
                                return "";
                              }
                            },
                            // hintSize: 26,
                          ),
                          SizedBox(
                            height: height * 0.025,
                          ),

                            Padding(
                              padding: EdgeInsets.only(right: width * 0.075),
                              child: RotatedBox(
                                  quarterTurns: 2,
                                  child: NextButton(
                                      function: () {
                                        if (controller.formWindowsOne.currentState!.validate()) {
                                          Get.to(() =>  RegisterTwoScreen());
                                        }
                                      },
                                      icon: Icons.arrow_back_ios_new_outlined)),
                            ),
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

//registerForWindows