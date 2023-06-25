import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edu_lens/controllers/phone_number_formatter.dart';
import 'package:edu_lens/controllers/login/register_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/widget/custom_dialog/snackBar.dart';
import 'package:edu_lens/view/widget/custom_dropdown_buttom.dart';
import 'package:edu_lens/view/widget/custom_scaffold_login.dart';
import 'package:edu_lens/view/widget/custom_social_media_icons.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:edu_lens/view/widget/custom_text_field_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CreateAccountForCollegeStudent extends GetView<RegisterController> {
    const CreateAccountForCollegeStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return CustomScaffoldLogin(
      screenHeight: screenHeight,
      screenWidth: screenWidth,
      widget: Form(
        key: controller.formStateUniversity,
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
            //last name
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
            //password
            CustomTextFieldLogin(
              function: (v) {
                controller.password2.value = v;
              },
              iconData: Icons.lock_reset,
              title: 'confirmationPasswordText'.tr,
              hint: "*********",
              colorBorder: AppConstants.primaryColor,
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
            ),
            //university
            CustomTextFieldLogin(
              function: (v) {
                controller.university.value = v;
              },
              iconData: Icons.school,
              title: Platform.isIOS ? "اسم الجامعة *" : 'اسم الجامعة',
              hint: "جامعة عين شمس",
              textInputType: TextInputType.name,
              colorBorder: AppConstants.primaryColor,
              validator: (value) {
                if (!Platform.isIOS) {
                  if (value.length < 5) {
                    showCustomSnackBar(
                        context: context,
                        title: "note".tr,
                        deck: "يجب كتابة اسم الجامعة بشكل صحيح",
                        contentType: ContentType.failure);
                    return "";
                  }
                }
              },
              // inputFormatters: [PhoneNumberFormatter()],
            ),
            //الكلية
            CustomTextFieldLogin(
              function: (v) {
                controller.faculty.value = v;
              },
              iconData: Icons.not_listed_location_rounded,
              title: "الكلية *",
              hint: "تجارة",
              textInputType: TextInputType.name,
              colorBorder: AppConstants.primaryColor,
              validator: (value) {
                if (!Platform.isIOS) {
                  if (value.length < 2) {
                    showCustomSnackBar(
                        context: context,
                        title: "note".tr,
                        deck: "يجب كتابة اسم الكلية بشكل صحيح",
                        contentType: ContentType.failure);
                    return "";
                  }
                }
              },
              // inputFormatters: [PhoneNumberFormatter()],
            ),
            //القسم
            CustomTextFieldLogin(
              function: (v) {
                controller.department.value = v;
              },
              iconData: Icons.not_listed_location_rounded,
              title: "القسم *",
              hint: "محاسبة",
              textInputType: TextInputType.name,
              colorBorder: AppConstants.primaryColor,
              validator: (value) {
                if (!Platform.isIOS) {
                  if (value.length < 2) {
                    showCustomSnackBar(
                        context: context,
                        title: "note".tr,
                        deck: "يجب كتابة اسم القسم بشكل صحيح",
                        contentType: ContentType.failure);
                    return "";
                  }
                }
              },
              // inputFormatters: [PhoneNumberFormatter()],
            ),
            Obx(() => CustomDropdownButton(
                  hint: controller.cityName.value,
                  function: (v) {
                    controller.cityName.value = v!;
                    controller.cityId.value = controller.citiesId[v]!;
                    debugPrint(controller.cityId.value.toString());
                  },
                  items: controller.city,
                )),
            const SizedBox(
              height: 20,
            ),
            Obx(() => CustomDropdownButton(
                  hint: controller.genderName.value,
                  function: (v) {
                    controller.genderName.value = v!;
                    controller.genderId.value =
                        controller.gendersId[v]!.toInt();
                    debugPrint(controller.genderId.value.toString());
                  },
                  items: controller.genders,
                )),
            const SizedBox(
              height: 20,
            ),

            Obx(() => CustomDropdownButton(
                  hint: controller.classesName.value,
                  function: (v) {
                    controller.classesName.value = v!;
                    controller.studentClassId.value =
                        controller.classesId[v]!.toInt();
                    debugPrint(controller.studentClassId.value.toString());
                  },
                  items: controller.classes,
                )),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => InkWell(
                  onTap: () async {
                    controller.newDateTime.value =
                        (await showRoundedDatePicker(
                      context: context,
                      height: 350,
                      initialDate: controller.newDateTime.value,
                      firstDate: DateTime(DateTime.now().year - 22),
                      lastDate: DateTime(DateTime.now().year + 1),
                      borderRadius: 16,
                      theme: Theme.of(context).copyWith(
                        primaryColor: AppConstants.primaryColor,
                        hintColor: AppConstants.primaryColor,
                        colorScheme: const ColorScheme.light(
                          primaryContainer: AppConstants.primaryColor,
                          primary: AppConstants.primaryColor,
                        ),
                      ),
                    ))!;
                    debugPrint(controller.newDateTime.toString());
                    controller.birthday.value =
                        controller.newDateTime.toString();
                  },
                  child: Container(
                    width: 230,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(25),
                        border:
                            Border.all(color: AppConstants.primaryColor)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 17, top: 8, bottom: 8),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_outlined,
                            color: AppConstants.primaryColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          CustomText(
                            text: controller.newDateTime != null
                                ? "${controller.newDateTime.value.year} / ${controller.newDateTime.value.month} / ${controller.newDateTime.value.day} *"
                                : "0000/00/00",
                            fontSize: 18,
                            color: AppConstants.primaryColor,
                          )
                        ],
                      ),
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  controller.registerUniversity(context);
                },
                child: Obx(() => controller.loading.value
                    ? const Center(
                        child: CircularProgressIndicator(color: AppConstants.lightPrimaryColor,),
                      )
                    : Container(
                        width: 300,
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                            color: AppConstants.lightPrimaryColor,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                color: AppConstants.lightPrimaryColor)),
                        child: CustomText(
                          text: "createAccountText".tr,
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ))),
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
