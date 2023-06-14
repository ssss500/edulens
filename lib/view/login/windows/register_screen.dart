import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edu_lens/view/login/windows/register_two_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/login/register_controller.dart';
import '../../../controllers/phone_number_formatter.dart';
import '../../../helper/app_constants.dart';
import '../../widget/custom_dialog/snackBar.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_text_field_login.dart';
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
                    right: width * 0.08,
                    top: height * 0.075,
                    left: width * 0.03,
                    bottom: height * 0.065),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Column(
                      children: [
                        SizedBox(
                          height: height * 0.048,
                        ),
                        RotatedBox(quarterTurns: 2,
                            child: IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back_ios_new_rounded))),
                      ],
                    ),
                    Row(
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
                                'welcomeRegister'.tr,
                                style: TextStyle(
                                  fontSize: width * 0.02,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      CustomText(
                                          text:  'firstName'.tr, fontSize: width * 0.012),
                                      SizedBox(
                                        height: height * 0.005,
                                      ),
                                      CustomTextFieldLogin(
                                        isMobile: false,
                                        function: (v) {
                                          controller.firstName.value = v;
                                        },
                                        iconData: Icons.person,
                                        hint: "سيف",
                                        textInputType: TextInputType.name,
                                        colorBorder: AppConstants.primaryColor,
                                        width: width * 0.085,
                                        validator: (value) {
                                          if (value.length < 3) {
                                            showCustomSnackBar(
                                                context: context,
                                                title: "note".tr,
                                                deck: "يجب كتابة الاسم الاول بشكل صحيح",
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

                                      CustomText(
                                          text:  'lastName'.tr, fontSize: width * 0.012),
                                      SizedBox(
                                        height: height * 0.005,
                                      ),
                                      CustomTextFieldLogin(
                                        function: (v) {
                                          controller.lastName.value = v;
                                        },
                                        iconData: Icons.person,
                                        isMobile:false,
                                        hint: "احمد",
                                        textInputType: TextInputType.name,
                                        colorBorder: AppConstants.primaryColor,
                                        width: width * 0.085,
                                        validator: (value) {
                                          if (value.length < 3) {
                                            showCustomSnackBar(
                                                context: context,
                                                title: "note".tr,
                                                deck: "يجب كتابة الاسم الاخير بشكل صحيح",
                                                contentType: ContentType.failure);
                                            return "";
                                          }
                                        },
                                        // inputFormatters: [PhoneNumberFormatter()],
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              CustomText(
                                  text:  'parentName'.tr, fontSize: width * 0.012),
                              SizedBox(
                                height: height * 0.005,
                              ),   CustomTextFieldLogin(
                                isMobile: false,
                                function: (v) {
                                  controller.parentName.value = v;
                                },
                                iconData: Icons.person,
                                hint: "اب ،ام ،اخ",
                                textInputType: TextInputType.name,
                                colorBorder: AppConstants.primaryColor,
                                width: width * 0.183,
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
                                // inputFormatters: [PhoneNumberFormatter()],
                              ),

                              CustomText(
                                  text:  'phoneNumberText'.tr, fontSize: width * 0.012),
                              SizedBox(
                                height: height * 0.005,
                              ),
                              CustomTextFieldLogin(
                                isMobile:  false,
                                function: (v) {
                                  controller.phone.value = v;
                                },
                                iconData: Icons.phone,
                                hint: "01010101010",
                                textInputType: TextInputType.phone,
                                colorBorder: AppConstants.primaryColor,
                                width: width * 0.183,
                                inputFormatters: [PhoneNumberFormatter()],
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

                              CustomText(
                                  text:  'dadPhoneNumberText'.tr, fontSize: width * 0.012),
                              SizedBox(
                                height: height * 0.005,
                              ),
                              CustomTextFieldLogin(
                                isMobile:false,
                                function: (v) {
                                  controller.parentPhone.value = v;
                                },
                                iconData: Icons.phone,
                                hint: "01010101010",
                                textInputType: TextInputType.phone,
                                colorBorder: AppConstants.primaryColor,
                                width: width * 0.183,
                                inputFormatters: [PhoneNumberFormatter()],
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
                        SizedBox(
                          width: width*0.088,
                        ),
                        Image.asset(
                          'assets/images/logo4.png',
                          width: width * 0.4,
                          height: height,
                        ),
                      ],
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