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
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';

import '../../widget/custom_dropdown_buttom.dart';
import '../../widget/custom_text.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({Key? key}) : super(key: key);
  RegisterController get controller => Get.find<RegisterController>();
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
            // CustomTextFieldLogin(
            //   function: (v) {
            //     controller.lastName.value = v;
            //   },
            //   iconData: Icons.person,
            //   title: 'lastName'.tr,
            //   hint: "احمد",
            //   textInputType: TextInputType.name,
            //   colorBorder: AppConstants.primaryColor,
            //   validator: (value) {
            //     if (value.length < 3) {
            //       showCustomSnackBar(
            //           context: context,
            //           title: "note".tr,
            //           deck: "يجب كتابة الاسم الاخير بشكل صحيح",
            //           contentType: ContentType.failure);
            //       return "";
            //     }
            //   },
            //   // inputFormatters: [PhoneNumberFormatter()],
            // ),
            //اسم ولى الامر //
            // CustomTextFieldLogin(
            //   function: (v) {
            //     controller.parentName.value = v;
            //   },
            //   iconData: Icons.person,
            //   title: "اسم ولي الامر",
            //   hint: "اب ،ام ،اخ",
            //   textInputType: TextInputType.name,
            //   colorBorder: AppConstants.primaryColor,
            //   validator: (value) {
            //     if (value.length < 3) {
            //       showCustomSnackBar(
            //           context: context,
            //           title: "note".tr,
            //           deck: "يجب كتابة اسم ولي الامر بشكل صحيح",
            //           contentType: ContentType.failure);
            //       return "";
            //     }
            //   },
            //   // inputFormatters: [PhoneNumberFormatter()],
            // ),
            //text field my phone
            CustomTextFieldLogin(
              function: (v) {
                controller.phone.value = v;
              },
              iconData: Icons.phone,
              title: "${'phoneNumberText'.tr} يحمل واتس اب",
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
            // CustomTextFieldLogin(
            //   function: (v) {
            //     controller.school.value = v;
            //   },
            //   iconData: Icons.school,
            //   title:Platform.isIOS? "اسم المدرسة *":'اسم المدرسة',
            //   hint: "مدرسة المشاغبين",
            //   textInputType: TextInputType.name,
            //   colorBorder: AppConstants.primaryColor,
            //   validator: (value) {
            //     if(!Platform.isIOS){
            //       if (value.length < 5) {
            //         showCustomSnackBar(
            //             context: context,
            //             title: "note".tr,
            //             deck: "يجب كتابة اسم المدرسة بشكل صحيح",
            //             contentType: ContentType.failure);
            //         return "";
            //       }
            //     }
            //   },
            //   // inputFormatters: [PhoneNumberFormatter()],
            // ),
            //ادارة
            // CustomTextFieldLogin(
            //   function: (v) {
            //     controller.department.value = v;
            //   },
            //   iconData: Icons.not_listed_location_rounded,
            //   title: "الاداره *",
            //   hint: "اداره",
            //   textInputType: TextInputType.name,
            //   colorBorder: AppConstants.primaryColor,
            //   validator: (value) {
            //     if(!Platform.isIOS){
            //       if (value.length < 5) {
            //         showCustomSnackBar(
            //             context: context,
            //             title: "note".tr,
            //             deck: "يجب كتابة اسم الادارة بشكل صحيح",
            //             contentType: ContentType.failure);
            //         return "";
            //       }
            //     }
            //   },
            //   // inputFormatters: [PhoneNumberFormatter()],
            // ),
            //text field email
            // CustomTextFieldLogin(
            //   function: (v) {
            //     controller.email.value = v;
            //   },
            //   iconData: Icons.email,
            //   title: 'email'.tr,
            //   hint: "saif@email.com",
            //   textInputType: TextInputType.emailAddress,
            //   colorBorder: AppConstants.primaryColor,
            //   autoFillHints: const [AutofillHints.email],
            //   validator: (value) {
            //     if (!value.contains("@")||value.length<8) {
            //       showCustomSnackBar(
            //           context: context,
            //           title: "note".tr,
            //           deck: "يجب كتابة البريد الالكتروني بشكل صحيح",
            //           contentType: ContentType.failure);
            //       return "";
            //     }
            //   },
            // ),
            // text field password
            Obx(() => CustomDropdownButton(
              hint: controller.sectionName.value,
              function: (v) {
                controller.sectionName.value = v!;
                controller.studentSectionId.value =
                    controller.sectionsId[v]!.toInt();
                // debugPrint(
                //     controller.studentSectionId.value.toString());
              },
              items: controller.sections,
            ),
            ),
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
            ),
            ),
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
            // const SizedBox(
            //   height: 20,
            // ),
            // Obx(() => CustomDropdownButton(
            //   hint: controller.year.value,
            //   function: (v) {
            //     controller.year.value = v!;
            //     if (controller.year.value == "تعليم حر") {
            //       controller.gradeId.value = "1";
            //     } else if (controller.year.value == "تعليم جامعى") {
            //       controller.gradeId.value = "2";
            //     } else if (controller.year.value == "تعليم مدرسى") {
            //       controller.gradeId.value = "3";
            //     }
            //   },
            //   items: controller.listYearString,
            // ),
            // ),
            const SizedBox(
              height: 20,
            ),

            // Obx(() => DropdownButtonHideUnderline(
            //       child: Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(30),
            //           color: Colors.white24,
            //           border: Border.all(
            //             color: primaryColor,
            //           ),
            //         ),
            //         width: MediaQuery.of(context).size.width-150,
            //         child: ButtonTheme(
            //           alignedDropdown: true,
            //           child: DropdownButton<CityModel>(
            //             isDense: true,
            //             isExpanded: true,
            //             borderRadius: BorderRadius.circular(30),
            //             value: controller.check.value == false
            //                 ? controller.cityList[0]
            //                 : controller.cityList[controller.CitiesId.value],
            //             icon: const Icon(
            //               Icons.arrow_drop_down_circle_outlined,
            //               color: primaryColor,
            //               size: 25,
            //             ),
            //             items: controller.cityList.map((items) {
            //               return DropdownMenuItem<CityModel>(
            //                 value: items,
            //                 child: Container(
            //                     alignment: Alignment.centerLeft,
            //                     width: 150,
            //                     child: Text(items.name!)),
            //               );
            //             }).toList(),
            //             onChanged: (newValue) {
            //               controller.check.value = true;
            //               controller.CitiesId.value =
            //                   controller.cityList.indexOf(newValue!);
            //               controller.allergyAlerts.value = controller
            //                   .cityList[controller.CitiesId.value].name!;
            //             },
            //           ),
            //         ),
            //       ),
            //     )),
            Obx(() => CustomDropdownButton(
              hint: controller.cityName.value,
              function: (v) {
                controller.cityName.value = v!;
                controller.cityId.value = controller.citiesId[v]!;
                debugPrint(controller.cityId.value.toString());
              },
              items: controller.city,
            ),
            ),
            const SizedBox(
              height: 20,
            ),
            // CustomDropdownButton(
            //   hint: 'region'.tr,
            //   function: (v) {},
            //   items: AppConstants.listYearString.toList(),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // InkWell(onTap: (){},child: ,),
            // Obx(
            //       () => InkWell(
            //       onTap: () async {
            //         controller.newDateTime.value = (await showRoundedDatePicker(
            //           context: context,
            //           height: 350,
            //           initialDate: controller.newDateTime.value,
            //           firstDate: DateTime(DateTime.now().year - 22),
            //           lastDate: DateTime(DateTime.now().year + 1),
            //           borderRadius: 16,
            //           theme: Theme.of(context).copyWith(
            //             primaryColor: AppConstants.primaryColor,
            //             hintColor: AppConstants.primaryColor,
            //             colorScheme: const ColorScheme.light(
            //               primaryContainer: AppConstants.primaryColor,
            //               primary: AppConstants.primaryColor,
            //             ),
            //           ),
            //         ))!;
            //         debugPrint(controller.newDateTime.toString());
            //         controller.birthday.value = controller.newDateTime.toString();
            //       },
            //       child: Container(
            //         width: 230,
            //         decoration: BoxDecoration(
            //             color: Colors.white70,
            //             borderRadius: BorderRadius.circular(25),
            //             border:
            //             Border.all(color: AppConstants.primaryColor)),
            //         child: Padding(
            //           padding: const EdgeInsets.only(
            //               left: 8.0, right: 17, top: 8, bottom: 8),
            //           child: Row(
            //             children: [
            //               const Icon(
            //                 Icons.calendar_month_outlined,
            //                 color: AppConstants.primaryColor,
            //                 size: 30,
            //               ),
            //               const SizedBox(
            //                 width: 14,
            //               ),
            //               CustomText(
            //                 // ignore: unnecessary_null_comparison
            //                 text: controller.newDateTime != null
            //                     ? "${controller.newDateTime.value.year} / ${controller.newDateTime.value.month} / ${controller.newDateTime.value.day} *"
            //                     : "0000/00/00",
            //                 fontSize: 18,
            //                 color: AppConstants.primaryColor,
            //               )
            //             ],
            //           ),
            //         ),
            //       )),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),

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
              height: 20,
            ),
            //login button
            // Container(
            //   padding: const EdgeInsets.all(10),
            //   width: 100,
            //   decoration: BoxDecoration(
            //       color: AppConstants.lightPrimaryColor,
            //       border: Border.all(color: Colors.white),
            //       borderRadius: BorderRadius.circular(50)),
            //   child: InkWell(
            //     onTap: () {
            //       if (controller.formStateOne.currentState!.validate()) {
            //         Get.toNamed(RoutesNames.register2);
            //       }
            //     },
            //     child:const Row(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children:  [
            //         Icon(
            //           Icons.chevron_left,
            //           size: 50,
            //           color: Colors.white,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            InkWell(
                onTap: () {
                  controller.register(context);
                },
                child: Obx(() => controller.loading.value
                    ? const Center(
                  child: CircularProgressIndicator(color: AppConstants.lightPrimaryColor,),
                )
                    : Container(
                  width: 250,
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
              height: 50,
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
