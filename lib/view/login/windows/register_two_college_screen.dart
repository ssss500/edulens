import 'dart:io';

import 'package:edu_lens/view/login/windows/register_three_college_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../../../controllers/login/register_controller.dart';
import '../../widget/custom_dialog/snackBar.dart';
import '../../widget/input_component.dart';
import '../../widget/next_button.dart';

class RegisterTwoCollegeScreen extends StatelessWidget {
   RegisterTwoCollegeScreen({Key? key}) : super(key: key);
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
                    Form(
                      key: controller.formWindowsUniTwo,
                      child: Column(
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
                              if (!value.contains("@") || value.length < 8) {
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
                            height: height * 0.001,
                          ),
                           Text(
                            'اسم الجامعة',
                            style: TextStyle(fontSize: width * 0.012),
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          InputComponent(
                            textInputType: TextInputType.text,
                            function: (String v) {
                              controller.university.value = v;
                            },
                            //inputFormatters: [PhoneNumberFormatter()],
                            icon: Icons.school,
                            hint: 'جامعة عين شمس',width: width * 0.183,
                            validator: (value){
                              if (value.length < 5) {
                                showCustomSnackBar(
                                    context: context,
                                    title: "note".tr,
                                    deck: "يجب كتابة اسم الجامعة بشكل صحيح",
                                    contentType: ContentType.failure);
                                return "";
                              }
                            },
                          ),
                          SizedBox(
                            height: height * 0.001,
                          ),
                           Text(
                            'اسم الكلية',
                            style: TextStyle(fontSize: width * 0.012),
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          InputComponent(
                            textInputType: TextInputType.text,
                            function: (String v) {
                              controller.faculty.value = v;
                            },
                            //inputFormatters: [PhoneNumberFormatter()],
                            icon: Icons.location_on_rounded,
                            hint: 'كلية تجارة',width: width * 0.183,
                            validator: (value){ if (value.length < 2) {
                              showCustomSnackBar(
                                  context: context,
                                  title: "note".tr,
                                  deck: "يجب كتابة اسم الكلية بشكل صحيح",
                                  contentType: ContentType.failure);
                              return "";
                            }},
                          ),
                          SizedBox(
                            height: height * 0.001,
                          ),

                          Text(
                            'القسم',
                            style:  TextStyle(fontSize: width * 0.012),
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          InputComponent(
                            textInputType: TextInputType.text,
                            function: (String v) {
                              controller.department.value = v;
                            },
                            icon: Icons.location_on_rounded,
                            hint: 'محاسبة',width: width * 0.183,
                            validator: (value){
                              if (value.length < 2) {
                                showCustomSnackBar(
                                    context: context,
                                    title: "note".tr,
                                    deck: "يجب كتابة اسم القسم بشكل صحيح",
                                    contentType: ContentType.failure);
                                return "";
                              }
                            },
                            // hintSize: 26,
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
                            height: height * 0.03,
                          ),
                          Padding(
                            padding:   EdgeInsets.only(right:  width * 0.04),
                            child:  Row(
                              children: [
                                RotatedBox(
                                  quarterTurns: 2,
                                  child: NextButton(
                                      function: (){
                                        if (controller.formWindowsUniTwo.currentState!.validate()) {
                                          Get.to(() =>  RegisterThreeCollegeScreen());
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
