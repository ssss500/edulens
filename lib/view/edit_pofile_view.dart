import 'package:edu_lens/controllers/phone_number_formatter.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/widget/custom_app_bar.dart';
import 'package:edu_lens/view/widget/custom_buttom.dart';
import 'package:edu_lens/view/widget/custom_dropdown_buttom.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:edu_lens/view/widget/custom_text_field_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
   EditProfileView({super.key});
  late DateTime newDateTime=DateTime.now();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return CustomAppBar(
      title: "editProfileView".tr,
      widget: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12),
          child: Column(
            children: [
             const SizedBox(
                height: 14,
              ),
              // //text filed my name
              CustomTextFieldLogin(
                iconData: Icons.person,
                title: 'studentName'.tr,
                hint: "سيف احمد سيف",
                textInputType: TextInputType.name,
                colorBorder: AppConstants.primaryColor,
                width: screenWidth,
              ),
              // //text field my phone
              CustomTextFieldLogin(
                iconData: Icons.phone,
                title: 'phoneNumberText'.tr,
                hint: "01010101010",
                textInputType: TextInputType.phone,
                colorBorder: AppConstants.primaryColor,
                width: screenWidth,
                inputFormatters: [PhoneNumberFormatter()],
              ),
              //text field dad phone
              CustomTextFieldLogin(
                iconData: Icons.phone,
                title: 'dadPhoneNumberText'.tr,
                hint: "01010101010",
                textInputType: TextInputType.phone,
                colorBorder: AppConstants.primaryColor,
                width: screenWidth,
                inputFormatters: [PhoneNumberFormatter()],
              ),
              //text field email
              CustomTextFieldLogin(
                iconData: Icons.email,
                title: 'email'.tr,
                hint: "saif@email.com",
                width: screenWidth,
                textInputType: TextInputType.emailAddress,
                colorBorder: AppConstants.primaryColor,
              ),
              // text field password
              CustomTextFieldLogin(
                iconData: Icons.lock,
                title: 'passwordText'.tr,
                width: screenWidth,
                hint: "*********",
                colorBorder: AppConstants.primaryColor,
              ),
              CustomTextFieldLogin(
                iconData: Icons.lock_reset,
                title: 'confirmationPasswordText'.tr,
                width: screenWidth,
                hint: "*********",
                colorBorder: AppConstants.primaryColor,
              ),
              //dropdown years
              CustomDropdownButton(
                hint: 'chooseYear'.tr,
                function: (v) {},
                width: screenWidth - 66,
                items: AppConstants.listYearString.toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomDropdownButton(
                hint: 'division'.tr,
                function: (v) {},
                width: screenWidth - 66,
                items: AppConstants.listYearString.toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomDropdownButton(
                hint: 'nationality'.tr,
                function: (v) {},
                width: screenWidth - 66,
                items: AppConstants.listYearString.toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomDropdownButton(
                hint: 'governorate'.tr,
                function: (v) {},
                width: screenWidth - 66,
                items: AppConstants.listYearString.toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomDropdownButton(
                hint: 'region'.tr,
                function: (v) {},
                width: screenWidth - 66,
                items: AppConstants.listYearString.toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {

                  newDateTime = (await showRoundedDatePicker(
                    context: context,
                    height: 350,
                    initialDate: DateTime(DateTime.now().year - 10),
                    firstDate: DateTime(DateTime.now().year - 22),
                    lastDate: DateTime(DateTime.now().year + 1),
                    borderRadius: 16,
                  ))!;
                  debugPrint(newDateTime.toString());
                },
                  child: Container(
                    width: screenWidth - 66,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: AppConstants.primaryColor)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 17,top: 8,bottom: 8),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        color: AppConstants.primaryColor,
                        size: 30,
                      ),
                      const SizedBox(width: 14,),
                      CustomText(text:newDateTime!=null?"${newDateTime.year} / ${newDateTime.month} / ${newDateTime.day}":"0000/00/00" ,fontSize: 18,color:  AppConstants.primaryColor,)
                    ],
                  ),
                ),
              )),

              const SizedBox(
                height: 20,
              ),
              CustomButton(
                function: () {
                  Get.back();
                },
                text: "saveEdit".tr,
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
