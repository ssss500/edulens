import 'package:edu_lens/view/widget/custom_registration_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import '../../../../controllers/login/register_controller.dart';
import '../../../../helper/app_constants.dart';
import '../../../widget/custom_dropdown_buttom.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/next_button.dart';

class RegisterThreeCollegeScreen extends StatelessWidget {
  RegisterThreeCollegeScreen({Key? key}) : super(key: key);
  RegisterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return CustomRegistrationView(
      widget: Form(
        key: controller.formWindowsUniThree,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              CustomText(text: 'welcomeCon'.tr, fontSize: width * 0.021),
              SizedBox(
                height: height * 0.02,
              ),
              CustomText(text: 'governorate'.tr, fontSize: width * 0.012),
              SizedBox(
                height: height * 0.012,
              ),
              Obx(() => CustomDropdownButton(
                  isMobile: false,
                  hint: controller.cityName.value,
                  function: (v) {
                    controller.cityName.value = v!;
                    controller.cityId.value = controller.citiesId[v]!;
                    debugPrint(controller.cityId.value.toString());
                  },
                  items: controller.city,
                  width: width * 0.183)),
              SizedBox(
                height: height * 0.015,
              ),
              CustomText(text: 'nationality'.tr, fontSize: width * 0.012),
              SizedBox(
                height: height * 0.012,
              ),
              Obx(() => CustomDropdownButton(
                  isMobile: false,
                  hint: controller.genderName.value,
                  function: (v) {
                    controller.genderName.value = v!;
                    controller.genderId.value =
                        controller.gendersId[v]!.toInt();
                    debugPrint(controller.genderId.value.toString());
                  },
                  items: controller.genders,
                  width: width * 0.183)),
              SizedBox(
                height: height * 0.015,
              ),
              CustomText(text: 'chooseYear'.tr, fontSize: width * 0.012),
              SizedBox(
                height: height * 0.012,
              ),
              Obx(
                () => CustomDropdownButton(
                  width: width * 0.183,
                  isMobile: false,
                  hint: controller.classesName.value,
                  function: (v) {
                    controller.classesName.value = v!;
                    controller.studentClassId.value =
                        controller.classesId[v]!.toInt();
                    debugPrint('hello');
                    debugPrint(controller.studentClassId.value.toString());
                    debugPrint(controller.classesName.value);
                  },
                  items: controller.classes,
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              CustomText(text: 'yearOfBirth'.tr, fontSize: width * 0.012),
              SizedBox(
                height: height * 0.012,
              ),
              Obx(
                () => InkWell(
                    onTap: () async {
                      controller.newDateTime.value =
                          (await showRoundedDatePicker(
                        context: context,
                        height: height * 0.18,
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
                          border: Border.all(color: AppConstants.primaryColor)),
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
              // SizedBox(
              //   height: height * 0.05,
              // ),
              // Padding(
              //   padding: EdgeInsets.only(right: width * 0.04),
              //   child: Row(
              //     children: [
              //       Obx(
              //         () => controller.loading.value
              //             ? const Center(
              //                 child: CircularProgressIndicator(
              //                   color: AppConstants.lightPrimaryColor,
              //                 ),
              //               )
              //             : NextButton(
              //                 function: () {
              //                   controller.registerUniversity(context);
              //                 },
              //                 icon: Icons.done),
              //       ),
              //       SizedBox(
              //         width: width * 0.03,
              //       ),
              //       NextButton(
              //           function: () {
              //             Get.back();
              //           },
              //           icon: Icons.arrow_back_ios_new_outlined),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
      funNextButton: (){
        controller.registerUniversity(context);
      },
    );
  }
}
