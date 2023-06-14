import 'package:edu_lens/controllers/login/register_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/widget/custom_dropdown_buttom.dart';
import 'package:edu_lens/view/widget/custom_scaffold_login.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';

class CreateAccountViewTow extends StatelessWidget {

 const CreateAccountViewTow({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder<RegisterController>(builder: (controller) {
      return CustomScaffoldLogin(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        widget: Column(
          children: [
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
            const SizedBox(
              height: 20,
            ),
            Obx(() => CustomDropdownButton(
                  hint: controller.year.value,
                  function: (v) {
                    controller.year.value = v!;
                    if (controller.year.value == "تعليم حر") {
                      controller.gradeId.value = "1";
                    } else if (controller.year.value == "تعليم جامعى") {
                      controller.gradeId.value = "2";
                    } else if (controller.year.value == "تعليم مدرسى") {
                      controller.gradeId.value = "3";
                    }
                  },
                  items: controller.listYearString,
                ),
            ),
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
            Obx(
              () => InkWell(
                  onTap: () async {
                    controller.newDateTime.value = (await showRoundedDatePicker(
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
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  controller.register(context);
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
              height: 50,
            ),
          ],
        ),
      );
    });
  }
}
