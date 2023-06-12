import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import 'package:edu_lens/controllers/login/register_controller.dart';
import 'package:edu_lens/view/login/windows/regieter_three_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/custom_dialog/snackBar.dart';
import '../../widget/input_component.dart';
import '../../widget/next_button.dart';

class RegisterTwoScreen extends StatelessWidget {
   RegisterTwoScreen({Key? key}) : super(key: key);
   RegisterController controller = Get.find();
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
                    Form( key: controller.formWindowsTwo,child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Text(
                          'اكمل بياناتك لانشاء الحساب!',
                          style: TextStyle(
                            fontSize: width * 0.02,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),

                        Text(
                          'اسم المدرسة',
                          style: TextStyle(fontSize: width * 0.012),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        InputComponent(
                          textInputType: TextInputType.text,
                          function: (String v) {
                            controller.school.value = v;
                          },
                          //inputFormatters: [PhoneNumberFormatter()],
                          icon: Icons.school,
                          validator: (value){
                            if (value.length < 5) {
                              showCustomSnackBar(
                                  context: context,
                                  title: "note".tr,
                                  deck: "يجب كتابة اسم المدرسة بشكل صحيح",
                                  contentType: ContentType.failure);
                              return "";
                            }
                          },
                          hint: 'مدرسة المشاغبين',width: width * 0.183,
                        ),
                        Text(
                          'الاداره التعليمية',
                          style: TextStyle(fontSize: width * 0.012),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        InputComponent(
                          textInputType: TextInputType.text,
                          function: (String v) {
                            controller.department.value = v;
                          },
                          //inputFormatters: [PhoneNumberFormatter()],
                          icon: Icons.location_on_rounded,
                          hint: 'اداره',width: width * 0.183,
                          validator: (value){
                            if (value.length < 5) {
                              showCustomSnackBar(
                                  context: context,
                                  title: "note".tr,
                                  deck: "يجب كتابة اسم الادارة بشكل صحيح",
                                  contentType: ContentType.failure);
                              return "";
                            }
                          },
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Text(
                          'email'.tr,
                          style:  TextStyle(fontSize: width * 0.012),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        InputComponent(
                          textInputType: TextInputType.text,
                          function: (String v) {
                            controller.email.value = v;
                          },
                          icon: Icons.mail,
                          hint: 'ahmed@gmail.com',width: width * 0.183,
                          // hintSize: 26,
                          validator: (value) {
                            if (!value.contains("@")||value.length<8) {
                              showCustomSnackBar(
                                  context: context,
                                  title: "note".tr,
                                  deck: "يجب كتابة البريد الالكتروني بشكل صحيح",
                                  contentType: ContentType.failure);
                              return "";
                            }
                          },
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
                                  'الرقم السري',
                                  style:  TextStyle(fontSize: width * 0.012),
                                ),
                                SizedBox(
                                  height: height * 0.005,
                                ),
                                InputComponent(
                                  textInputType: TextInputType.text,
                                  function: (String v) {
                                    controller.password.value = v;
                                  },
                                  width: width * 0.085,
                                  //inputFormatters: [PhoneNumberFormatter()],
                                  icon: Icons.lock,
                                  hint:'*****',
                                  validator:  (value) {
                                    if (value.length<5) {
                                      showCustomSnackBar(
                                          context: context,
                                          title: "note".tr,
                                          deck: "يجب كتابة كلمة المرور بشكل صحيح",
                                          contentType: ContentType.failure);
                                      return "";
                                    }
                                  },
                                ),
                              ],
                            ),
                            SizedBox(width: width*0.0095,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'تأكيد الرقم السري',
                                  style:  TextStyle(fontSize: width * 0.012),
                                ),
                                SizedBox(
                                  height: height * 0.005,
                                ),
                                InputComponent(
                                  textInputType: TextInputType.text,
                                  function: (String v) {
                                    controller.password2.value = v;
                                  },
                                  width: width * 0.085,
                                  //inputFormatters: [PhoneNumberFormatter()],
                                  icon: Icons.lock,
                                  hint: '*****',
                                  validator: (value) {
                                    if (controller.password2.value.trim()!=controller.password.value.trim()) {
                                      showCustomSnackBar(
                                          context: context,
                                          title: "note".tr,
                                          deck: "يجب ان تكون كلمة المرور متطابقة",
                                          contentType: ContentType.failure);
                                      return "";
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Obx(
                        //   () => controller.loading.value
                        //       ? const Center(
                        //           child: CircularProgressIndicator(
                        //             color: AppConstants.lightPrimaryColor,
                        //           ),
                        //         )
                        //   :

                        //  ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: const  EdgeInsets.only(right: 65.0),
                          child:  Row(
                            children: [
                              RotatedBox(
                                quarterTurns: 2,
                                child: NextButton(
                                    function: (){
                                      if (controller.formWindowsTwo.currentState!.validate()) {
                                        Get.to(() =>  RegisterThreeScreen());
                                      }
                                    },
                                    icon: Icons.arrow_back_ios_new_outlined),
                              ),
                              SizedBox(width: width*0.03,),
                              NextButton(
                                  function: (){
                                    Get.back();
                                  },
                                  icon: Icons.arrow_back_ios_new_outlined),
                            ],
                          ),
                        )
                      ],
                    ),),
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
