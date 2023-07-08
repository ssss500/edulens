import 'package:edu_lens/routes/routes_names.dart';
import 'package:edu_lens/view/widget/custom_registration_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../../../../controllers/login/register_controller.dart';
import '../../../../controllers/phone_number_formatter.dart';
import '../../../../helper/app_constants.dart';
import '../../../widget/custom_dialog/snackBar.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/custom_text_field_login.dart';
import '../../../widget/next_button.dart';

class RegisterOneCollegeScreen extends GetView<RegisterController> {
  const RegisterOneCollegeScreen({Key? key}) : super(key: key);
 // RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return CustomRegistrationView(widget:
    Form(
      key: controller.formWindowsUniOne,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.04,
            ),

            CustomText(
                text:  'welcomeRegister'.tr, fontSize: width * 0.018),
            SizedBox(
              height: height * 0.03,
            ),
            CustomText(
                text:  'firstName'.tr, fontSize: width * 0.012),
            SizedBox(
              height: height * 0.005,
            ),
            CustomTextFieldLogin(
              isMobile: false,
              textInputType: TextInputType.text,
              function: (String v) {
                controller.firstName.value = v;
              },
              width: width * 0.183,
              iconData: Icons.person,
              hint: 'سيف',
              colorBorder: AppConstants.primaryColor,
              validator: (value) {
                if (value.length < 3) {
                  showCustomSnackBar(
                      context: context,
                      title: "note".tr,
                      deck:
                      "يجب كتابة الاسم الاول بشكل صحيح",
                      contentType: ContentType.failure);
                  return "";
                }
              },
            ),
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
              width: width * 0.183,
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


            CustomText(
                text:  'phoneNumberText'.tr, fontSize: width * 0.012),
            SizedBox(
              height: height * 0.005,
            ),
            CustomTextFieldLogin(
              isMobile: false,
              function: (v) {
                controller.phone.value = v;
              },
              iconData: Icons.phone,
              hint: "01010101010",
              textInputType: TextInputType.phone,
              colorBorder: AppConstants.primaryColor,
              inputFormatters: [PhoneNumberFormatter()],
              width: width * 0.183,
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

            CustomText(
                text:  'passwordText'.tr, fontSize: width * 0.012),
            SizedBox(
              height: height * 0.005,
            ),
            CustomTextFieldLogin(
              isMobile:  false,
              function: (v) {
                controller.password.value = v;
              },
              iconData: Icons.phone,
              hint: "*********",
              textInputType: TextInputType.phone,
              colorBorder: AppConstants.primaryColor,
              width: width * 0.183,
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
            SizedBox(
              height: height * 0.005,
            ),
            CustomText(
                text: 'confirmationPasswordText'.tr, fontSize: width * 0.012),
            SizedBox(
              height: height * 0.005,
            ),
            CustomTextFieldLogin(
              isMobile: false,
              function: (v) {
                controller.password2.value = v;
              },
              iconData: Icons.lock_reset,
              width: width * 0.183,
              hint: "*********",
              colorBorder: AppConstants.primaryColor,
              validator: (value) {
                if (controller.password2.value !=
                    controller.password.value ||value.length<5) {
                  showCustomSnackBar(
                      context: context,
                      title: "note".tr,
                      deck: "يجب ان تكون كلمة المرور متطابقة",
                      contentType: ContentType.failure);
                  return "";
                }
              },
            ),

            // SizedBox(
            //   height: height * 0.025,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(right: width * 0.07),
            //   child: RotatedBox(
            //       quarterTurns: 2,
            //       child: NextButton(
            //           function: () {
            //             if (controller.formWindowsUniOne.currentState!.validate()) {
            //               Get.toNamed('registerUni2');
            //             }
            //           },
            //           icon: Icons.arrow_back_ios_new_outlined)),
            // ),
          ],
        ),
      ),
    ), funNextButton: (){
      if (controller.formWindowsUniOne.currentState!.validate()) {
        Get.toNamed(RoutesNames.registerUni2);
      }
    },);
  }
}
