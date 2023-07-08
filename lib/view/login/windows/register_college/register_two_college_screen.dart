 import 'package:edu_lens/routes/routes_names.dart';
import 'package:edu_lens/view/login/windows/register_college/register_three_college_screen.dart';
import 'package:edu_lens/view/widget/custom_registration_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../../../../controllers/login/register_controller.dart';
import '../../../../helper/app_constants.dart';
import '../../../widget/custom_dialog/snackBar.dart';
import '../../../widget/custom_text_field_login.dart';
import '../../../widget/next_button.dart';

class RegisterTwoCollegeScreen extends GetView<RegisterController> {
 const RegisterTwoCollegeScreen({Key? key}) : super(key: key);
 // RegisterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return CustomRegistrationView(
      widget: Form(
        key: controller.formWindowsUniTwo,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: height * 0.04,
              // ),
              Text(
                'welcomeCon'.tr,
                style: TextStyle(
                  fontSize: width * 0.015,
                ),
              ),
              SizedBox(
                height: height * 0.0005,
              ),
              Text(
                'email'.tr,
                style: TextStyle(fontSize: width * 0.012),
              ),
              SizedBox(
                height: height * 0.0005,
              ),
              CustomTextFieldLogin(
                isMobile: false,
                function: (v) {
                  controller.email.value = v;
                },
                iconData: Icons.email,
                title: 'email'.tr,
                hint: "saif@email.com",
                width: width * 0.183,
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

              SizedBox(
                height: height * 0.0005,
              ),
              Text(
                'uniName'.tr,
                style: TextStyle(fontSize: width * 0.012),
              ),
              SizedBox(
                height: height * 0.0005,
              ),
              CustomTextFieldLogin(
                isMobile: false,
                function: (v) {
                  controller.university.value = v;
                },
                iconData: Icons.school,
                hint: "جامعة عين شمس",
                textInputType: TextInputType.name,
                width: width * 0.183,
                colorBorder: AppConstants.primaryColor,
                validator: (value) {
                  if (value.length < 5) {
                    showCustomSnackBar(
                        context: context,
                        title: "note".tr,
                        deck: "يجب كتابة اسم الجامعة بشكل صحيح",
                        contentType: ContentType.failure);
                    return "";
                  }
                },
                // inputFormatters: [PhoneNumberFormatter()],
              ),

              SizedBox(
                height: height * 0.0005,
              ),
              Text(
                'collegeName'.tr,
                style: TextStyle(fontSize: width * 0.012),
              ),
              SizedBox(
                height: height * 0.0005,
              ),
              CustomTextFieldLogin(
                isMobile: false,
                function: (v) {
                  controller.faculty.value = v;
                },
                iconData: Icons.not_listed_location_rounded,
                hint: "تجارة",
                textInputType: TextInputType.name,
                width: width * 0.183,
                colorBorder: AppConstants.primaryColor,
                validator: (value) {
                  if (value.length < 2) {
                    showCustomSnackBar(
                        context: context,
                        title: "note".tr,
                        deck: "يجب كتابة اسم الكلية بشكل صحيح",
                        contentType: ContentType.failure);
                    return "";
                  }
                },
                // inputFormatters: [PhoneNumberFormatter()],
              ),
              SizedBox(
                height: height * 0.0005,
              ),
              Text(
                'depName'.tr,
                style: TextStyle(fontSize: width * 0.012),
              ),
              SizedBox(
                height: height * 0.0005,
              ),
              CustomTextFieldLogin(
                isMobile: false,
                function: (v) {
                  controller.department.value = v;
                },
                iconData: Icons.not_listed_location_rounded,
                hint: "محاسبة",
                textInputType: TextInputType.name,
                width: width * 0.183,
                colorBorder: AppConstants.primaryColor,
                validator: (value) {
                  if (value.length < 2) {
                    showCustomSnackBar(
                        context: context,
                        title: "note".tr,
                        deck: "يجب كتابة اسم القسم بشكل صحيح",
                        contentType: ContentType.failure);
                    return "";
                  }
                  return null;
                },
                // inputFormatters: [PhoneNumberFormatter()],
              ),
            ],
          ),
        ),
      ),
      funNextButton: () {
        if (controller.formWindowsUniTwo.currentState!.validate()) {
          Get.toNamed(RoutesNames.registerUni3);
        }
      },
    );
  }
}
