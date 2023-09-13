import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edu_lens/controllers/phone_number_formatter.dart';
import 'package:edu_lens/controllers/login/register_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/routes/routes_names.dart';
import 'package:edu_lens/view/login/mobile/create_account_view_tow.dart';
import 'package:edu_lens/view/widget/custom_dialog/snackBar.dart';
import 'package:edu_lens/view/widget/custom_scaffold_login.dart';
import 'package:edu_lens/view/widget/custom_social_media_icons.dart';
import 'package:edu_lens/view/widget/custom_text_field_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountView extends GetView<RegisterController> {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    //final controller = Get.find();
    return CustomScaffoldLogin(
      screenHeight: screenHeight,
      screenWidth: screenWidth,
      widget: Form(
        key: controller.formStateOne,
        child: Column(
          children: [
            //text filed my name
            CustomTextFieldLogin(
              function: (v) {
                controller.firstName.value = v;
              },
              iconData: Icons.person,
              title: 'studentName'.tr,
              hint: "سيف",
              textInputType: TextInputType.name,
              colorBorder: AppConstants.primaryColor,
              validator: (value) {
                if (value.length < 3) {
                  showCustomSnackBar(
                      context: context,
                      title: "note".tr,
                      deck: "يجب كتابة اسم الطالب بشكل صحيح",
                      contentType: ContentType.failure);
                  return "";
                }
              },
              // inputFormatters: [PhoneNumberFormatter()],
            ),
            CustomTextFieldLogin(
              function: (v) {
                controller.lastName.value = v;
              },
              iconData: Icons.person,
              title: 'lastName'.tr,
              hint: "احمد",
              textInputType: TextInputType.name,
              colorBorder: AppConstants.primaryColor,
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
            //اسم ولى الامر //
            CustomTextFieldLogin(
              function: (v) {
                controller.parentName.value = v;
              },
              iconData: Icons.person,
              title: "اسم ولي الامر",
              hint: "اب ،ام ،اخ",
              textInputType: TextInputType.name,
              colorBorder: AppConstants.primaryColor,
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
            //text field my phone
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
            //text field dad phone
            CustomTextFieldLogin(
              function: (v) {
                controller.parentPhone.value = v;
              },
              iconData: Icons.phone,
              title: 'dadPhoneNumberText'.tr,
              hint: "01010101010",
              textInputType: TextInputType.phone,
              colorBorder: AppConstants.primaryColor,
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
            //school
            CustomTextFieldLogin(
              function: (v) {
                controller.school.value = v;
              },
              iconData: Icons.school,
              title:Platform.isIOS? "اسم المدرسة *":'اسم المدرسة',
              hint: "مدرسة المشاغبين",
              textInputType: TextInputType.name,
              colorBorder: AppConstants.primaryColor,
              validator: (value) {
                if(!Platform.isIOS){
                  if (value.length < 5) {
                    showCustomSnackBar(
                        context: context,
                        title: "note".tr,
                        deck: "يجب كتابة اسم المدرسة بشكل صحيح",
                        contentType: ContentType.failure);
                    return "";
                  }
                }
              },
              // inputFormatters: [PhoneNumberFormatter()],
            ),
            //ادارة
            CustomTextFieldLogin(
              function: (v) {
                controller.department.value = v;
              },
              iconData: Icons.not_listed_location_rounded,
              title: "الاداره *",
              hint: "اداره",
              textInputType: TextInputType.name,
              colorBorder: AppConstants.primaryColor,
              validator: (value) {
                if(!Platform.isIOS){
                  if (value.length < 5) {
                    showCustomSnackBar(
                        context: context,
                        title: "note".tr,
                        deck: "يجب كتابة اسم الادارة بشكل صحيح",
                        contentType: ContentType.failure);
                    return "";
                  }
                }
              },
              // inputFormatters: [PhoneNumberFormatter()],
            ),
            //text field email
            CustomTextFieldLogin(
              function: (v) {
                controller.email.value = v;
              },
              iconData: Icons.email,
              title: 'email'.tr,
              hint: "saif@email.com",
              textInputType: TextInputType.emailAddress,
              colorBorder: AppConstants.primaryColor,
              autoFillHints: const [AutofillHints.email],
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
            // text field password
            CustomTextFieldLogin(
              function: (v) {
                controller.password.value = v;
              },
              iconData: Icons.lock,
              title: 'passwordText'.tr,
              hint: "*********",
              colorBorder: AppConstants.primaryColor,
              validator: (value) {
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
            CustomTextFieldLogin(
              function: (v) {
                controller.password2.value = v;
              },
              iconData: Icons.lock_reset,
              title: 'confirmationPasswordText'.tr,
              hint: "*********",
              colorBorder: AppConstants.primaryColor,
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
            const SizedBox(
              height: 40,
            ),
            //login button
            Container(
              padding: const EdgeInsets.all(10),
              width: 100,
              decoration: BoxDecoration(
                  color: AppConstants.lightPrimaryColor,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(50)),
              child: InkWell(
                onTap: () {
                  if (controller.formStateOne.currentState!.validate()) {
                    Get.toNamed(RoutesNames.register2);
                  }
                },
                child:const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Icon(
                      Icons.chevron_left,
                      size: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            customSocialMediaIcons(),

            const SizedBox(
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}
