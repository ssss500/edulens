import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import 'package:edu_lens/view/widget/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controllers/login/register_controller.dart';
import '../../../helper/app_constants.dart';
import '../../home/home_screen.dart';
import '../../widget/custom_dialog/snackBar.dart';
import '../../widget/custom_text.dart';
import '../../widget/drop_down_component.dart';
import '../../widget/input_component.dart';

class RegisterThreeScreen extends StatelessWidget {
  RegisterThreeScreen({Key? key}) : super(key: key);
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
                      key: controller.formWindowsThree,
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
                          // SizedBox(
                          //   height: height * 0.008,
                          // ),

                          Text(
                            'الشعبة',
                            style: TextStyle(fontSize: width * 0.012),
                          ),
                          // SizedBox(
                          //   height: height * 0.005,
                          // ),
                          Obx(
                            () => DropDownComponent(
                                items: controller.sections,
                                function: (String? v) {
                                  controller.sectionName.value = v!;
                                  controller.studentSectionId.value =
                                      controller.sectionsId[v]!.toInt();
                                },
                                hint: controller.sectionName.value,
                                width: width * 0.183),
                          ),
                          // SizedBox(
                          //   height: height * 0.005,
                          // ),
                          Text(
                            'الجنس',
                            style: TextStyle(fontSize: width * 0.012),
                          ),
                          // SizedBox(
                          //   height: height * 0.005,
                          // ),
                          Obx(
                            () => DropDownComponent(
                              items: controller.genders,
                              function: (String? v) {
                                controller.genderName.value = v!;
                                controller.genderId.value =
                                    controller.gendersId[v]!.toInt();
                              },
                              hint: controller.genderName.value,
                              width: width * 0.183,
                            ),
                          ),

                          // SizedBox(
                          //   height: height * 0.005,
                          // ),
                          Text(
                            'السنه الدراسية',
                            style: TextStyle(fontSize: width * 0.012),
                          ),
                          // SizedBox(
                          //   height: height * 0.005,
                          // ),
                          Obx(
                            () => DropDownComponent(
                                items: controller.listYearString,
                                function: (String? v) {
                                  controller.year.value = v!;
                                  if (controller.year.value ==
                                      "تعليم جامعى") {
                                    controller.gradeId.value = "2";
                                  } else if (controller.year.value ==
                                      "تعليم مدرسى") {
                                    controller.gradeId.value = "3";
                                  }
                                  controller.year.value = v;

                                },
                                hint: controller.year.value,
                                width: width * 0.183),
                          ),

                          // SizedBox(
                          //   height: height * 0.005,
                          // ),
                          Text(
                            'المحافظة',
                            style: TextStyle(fontSize: width * 0.012),
                          ),

                          Obx(
                            () => DropDownComponent(
                              items:controller.city,
                              function: (String? v) {
                                controller.cityName.value = v!;
                                controller.cityId.value = controller.citiesId[v]!;
                              },
                              hint: controller.cityName.value,
                              width: width * 0.183,
                            ),
                          ),

                          Text(
                            'سنه الميلاد ',
                            style: TextStyle(fontSize: width * 0.012),
                          ),

                          Obx(
                                () => InkWell(
                                onTap: () async {
                                  controller.newDateTime.value = (await showRoundedDatePicker(
                                    context: context,
                                    height: height*0.18,
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
                                  controller.birthday.value = controller.newDateTime.toString();
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
                                          // ignore: unnecessary_null_comparison
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
                         // ),


                          SizedBox(
                            height: height * 0.015,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: width * 0.035),
                            child: Row(
                              children: [
                                Obx(
                                  () => controller.loading.value
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                            color:
                                                AppConstants.lightPrimaryColor,
                                          ),
                                        )
                                      : NextButton(
                                          function: () {
                                            controller
                                                .registerForWindows(context);
                                            // Get.to(()=> const HomeScreen());
                                          },
                                          icon: Icons.done),
                                ),
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                NextButton(
                                    function: () {
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
