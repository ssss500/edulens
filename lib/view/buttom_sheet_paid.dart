import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/controllers/phone_number_formatter.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/model/courses_models/chapter_model.dart';
import 'package:edu_lens/model/profile_teacher_models/booking_model.dart';
import 'package:edu_lens/model/profile_teacher_models/month_exam_model.dart';
import 'package:edu_lens/services/payment_services.dart';
import 'package:edu_lens/view/widget/custom_loading.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:edu_lens/view/widget/custom_text_field_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class BottomSheetPey {
  static void bottomSheetPaidForLecture({
    required Lecture dataLecture,
    required BuildContext context,
  }) {
    HomeController homeController = Get.put(HomeController());
    final paymentServices = PaymentServices();
    GlobalKey<FormState> formState = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController();
    Get.bottomSheet(
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: Scaffold(
          // extendBodyBehindAppBar: false,
          // extendBody: true,
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14, top: 30),
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(
                    text: "buyLecture".tr,
                    fontSize: 30,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomText(
                    text: "${"nameLecture".tr} : ${dataLecture.name}",
                    fontSize: 18,
                    alignment: Alignment.centerRight,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomText(
                    text: "${"costLecture".tr} : ${dataLecture.cost}",
                    fontSize: 18,
                    alignment: Alignment.centerRight,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: AppConstants.primaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Form(
                              key: formState,
                              child: CustomTextFieldLogin(
                                // function: (v) {
                                //   controller.text = v;
                                // },
                                iconData: Icons.credit_card_sharp,
                                width:
                                    MediaQuery.of(Get.context!).size.width - 160,
                                title: 'lectureCode'.tr,
                                controller: controller,
                                hint: "121212121212",
                                textInputType: TextInputType.number,
                                colorBorder: AppConstants.primaryColor,
                                inputFormatters: [CodeFormatter()],
                                validator: (v) {
                                  if (v.length < 10) {
                                    return "";
                                  }
                                },
                              ),
                            ),
                            InkWell(
                                onTap: () async {
                                  controller.text =
                                      await FlutterBarcodeScanner.scanBarcode(
                                          '#ff6666', 'رجوع', true, ScanMode.QR);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Icon(
                                    Icons.qr_code,
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        ),
                        InkWell(
                          onTap: () async {
                            if (formState.currentState!.validate()) {
                              Get.dialog(CustomLoading());
                              await paymentServices.buyLectureByCoupon(
                                  code: controller.text,
                                  lectureId: dataLecture.id,
                                  teacherId: dataLecture.teacherId,
                                  context: context);
                              Get.back();
                            }
                          },
                          child: Container(
                              width: 150,
                              padding: const EdgeInsets.only(
                                  top: 9, bottom: 9, right: 7, left: 7),
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: AppConstants.primaryColor,
                                border: Border.all(
                                    color: AppConstants.primaryColor, width: 2.0),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Center(
                                  child: CustomText(
                                text: "payText".tr,
                                fontSize: 18,
                                textDirection: TextDirection.ltr,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ))),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Get.dialog(CustomLoading());
                      await paymentServices.buyLectureByBucket(
                          lectureId: dataLecture.id,
                          teacherId: dataLecture.teacherId,
                          context: context);
                      Get.back();
                    },
                    child:Obx(
                          ()=> Container(
                          width: 300,
                          padding: const EdgeInsets.only(
                              top: 9, bottom: 9, right: 7, left: 7),
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            color: AppConstants.primaryColor,
                            border: Border.all(
                                color: AppConstants.primaryColor, width: 2.0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Center(
                              child: Column(
                            children: [
                              CustomText(
                                text: "purchasingByWallet".tr,
                                fontSize: 18,
                                textDirection: TextDirection.ltr,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              CustomText(
                                text:
                                    "${"walletBalance".tr} : ${homeController.studentProfile[0].bucket}",
                                fontSize: 14,
                                textDirection: TextDirection.ltr,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ))),
                    ),
                  ),
                 const SizedBox(height: 40,),
                ],
              ),
            ),
          ),
        ),
      ),
      enableDrag: true,
      backgroundColor: Colors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
    );
  }

  static void bottomSheetPaidForChapter({
    required ChapterModel dataChapter,
    required BuildContext context,
  }) {
    HomeController homeController = Get.put(HomeController());
    final paymentServices = PaymentServices();
    GlobalKey<FormState> formState = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController();
    // String code = '';
    Get.bottomSheet(
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,

          body: Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14, top: 30),
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(
                    text: "buyChapter".tr,
                    fontSize: 30,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomText(
                    text: "${"nameChapter".tr} : ${dataChapter.name}",
                    fontSize: 18,
                    alignment: Alignment.centerRight,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomText(
                    text: "${"costChapter".tr} : ${dataChapter.cost}",
                    fontSize: 18,
                    alignment: Alignment.centerRight,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: AppConstants.primaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Form(
                              key: formState,
                              child: CustomTextFieldLogin(
                                // function: (v) {
                                //   controller.text = v;
                                // },
                                iconData: Icons.credit_card_sharp,
                                width:
                                    MediaQuery.of(Get.context!).size.width - 160,
                                title: 'chapterCode'.tr,
                                controller: controller,
                                hint: "121212121212",
                                textInputType: TextInputType.number,
                                colorBorder: AppConstants.primaryColor,
                                inputFormatters: [CodeFormatter()],
                                validator: (v) {
                                  if (v.length < 10) {
                                    return "";
                                  }
                                },
                              ),
                            ),
                            InkWell(
                                onTap: () async {
                                  controller.text =
                                      await FlutterBarcodeScanner.scanBarcode(
                                          '#ff6666', 'رجوع', true, ScanMode.QR);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Icon(
                                    Icons.qr_code,
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        ),
                        InkWell(
                          onTap: () async {
                            if (formState.currentState!.validate()) {
                              Get.dialog(CustomLoading());
                              await paymentServices.buyChapterByCoupon(
                                  code: controller.text,
                                  chapterId: dataChapter.id,
                                  teacherId: dataChapter.lectures[0].teacherId,
                                  context: context);
                              Get.back();
                            }
                          },
                          child: Container(
                              width: 150,
                              padding: const EdgeInsets.only(
                                  top: 9, bottom: 9, right: 7, left: 7),
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: AppConstants.primaryColor,
                                border: Border.all(
                                    color: AppConstants.primaryColor, width: 2.0),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Center(
                                  child: CustomText(
                                text: "payText".tr,
                                fontSize: 18,
                                textDirection: TextDirection.ltr,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ))),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Get.dialog(CustomLoading());
                      await paymentServices.buyChapterByBucket(
                          chapterId: dataChapter.id,
                          teacherId: dataChapter.lectures![0].teacherId,
                          context: context);
                      Get.back();
                    },
                    child: Obx(
                          ()=>Container(
                          width: 300,
                          padding: const EdgeInsets.only(
                              top: 9, bottom: 9, right: 7, left: 7),
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            color: AppConstants.primaryColor,
                            border: Border.all(
                                color: AppConstants.primaryColor, width: 2.0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Center(
                              child: Column(
                            children: [
                              CustomText(
                                text: "purchasingByWallet".tr,
                                fontSize: 18,
                                textDirection: TextDirection.ltr,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              CustomText(
                                text:
                                    "${"walletBalance".tr} : ${homeController.studentProfile[0].bucket}",
                                fontSize: 14,
                                textDirection: TextDirection.ltr,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ))),
                    ),
                  ),
                  const SizedBox(height: 40,),

                ],
              ),
            ),
          ),
        ),
      ),
      enableDrag: true,
      backgroundColor: Colors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
    );
  }

  static void bottomSheetPaidForMonthExam({
    required MonthExamModel dataMonthExam,
    required BuildContext context,
  }) {
    HomeController homeController = Get.put(HomeController());
    final paymentServices = PaymentServices();
    GlobalKey<FormState> formState = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController();
    Get.bottomSheet(
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14, top: 30),
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(
                    text: "buyMonthExam".tr,
                    fontSize: 30,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomText(
                    text: "${"nameMonthExam".tr} : ${dataMonthExam.title}",
                    fontSize: 18,
                    alignment: Alignment.centerRight,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomText(
                    text: "${"costMonthExam".tr} : ${dataMonthExam.cost}",
                    fontSize: 18,
                    alignment: Alignment.centerRight,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: AppConstants.primaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Form(
                              key: formState,
                              child: CustomTextFieldLogin(
                                // function: (v) {
                                //   controller.text = v;
                                // },
                                iconData: Icons.credit_card_sharp,
                                width:
                                MediaQuery.of(Get.context!).size.width - 160,
                                title: 'chapterCode'.tr,
                                controller: controller,
                                hint: "121212121212",
                                textInputType: TextInputType.number,
                                colorBorder: AppConstants.primaryColor,
                                inputFormatters: [CodeFormatter()],
                                validator: (v) {
                                  if (v.length < 10) {
                                    return "";
                                  }
                                },
                              ),
                            ),
                            InkWell(
                                onTap: () async {
                                  controller.text =
                                  await FlutterBarcodeScanner.scanBarcode(
                                      '#ff6666', 'رجوع', true, ScanMode.QR);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Icon(
                                    Icons.qr_code,
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        ),
                        InkWell(
                          onTap: () async {
                            if (formState.currentState!.validate()) {
                              Get.dialog(CustomLoading());
                              await paymentServices.buyMonthExamByCoupon(
                                  code: controller.text,
                                  monthExamId: dataMonthExam.id,
                                  teacherId: dataMonthExam.teacherId,
                                  context: context);
                              Get.back();
                            }
                          },
                          child: Container(
                              width: 150,
                              padding: const EdgeInsets.only(
                                  top: 9, bottom: 9, right: 7, left: 7),
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: AppConstants.primaryColor,
                                border: Border.all(
                                    color: AppConstants.primaryColor, width: 2.0),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Center(
                                  child: CustomText(
                                    text: "payText".tr,
                                    fontSize: 18,
                                    textDirection: TextDirection.ltr,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ))),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Get.dialog(CustomLoading());
                      await paymentServices.buyMonthExamByBucket(
                          examId: dataMonthExam.id!,
                          teacherId: dataMonthExam.teacherId!,
                          context: context);
                      Get.back();
                    },
                    child: Obx(
                          ()=> Container(
                          width: 300,
                          padding: const EdgeInsets.only(
                              top: 9, bottom: 9, right: 7, left: 7),
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            color: AppConstants.primaryColor,
                            border: Border.all(
                                color: AppConstants.primaryColor, width: 2.0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Center(
                              child: Column(
                            children: [
                              CustomText(
                                text: "purchasingByWallet".tr,
                                fontSize: 18,
                                textDirection: TextDirection.ltr,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              CustomText(
                                text:
                                    "${"walletBalance".tr} : ${homeController.studentProfile[0].bucket}",
                                fontSize: 14,
                                textDirection: TextDirection.ltr,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ))),
                    ),
                  ),
                  const SizedBox(height: 40,),

                ],
              ),
            ),
          ),
        ),
      ),
      enableDrag: true,
      backgroundColor: Colors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
    );
  }
  static void bottomSheetReserveCourse({
    required BookingModel bookingModel,
    required BuildContext context,
  }) {
    HomeController homeController = Get.put(HomeController());
    final paymentServices = PaymentServices();
    Get.bottomSheet(
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,

          body: Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14, top: 30),
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(
                    text: "reserveCourse".tr,
                    fontSize: 30,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomText(
                    text: "${"nameMonthExam".tr} : ${bookingModel.name}",
                    fontSize: 18,
                    alignment: Alignment.centerRight,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomText(
                    text: "${"costMonthExam".tr} : ${bookingModel.cost}",
                    fontSize: 18,
                    alignment: Alignment.centerRight,
                  ),
                  InkWell(
                    onTap: () async {
                      Get.dialog(CustomLoading());
                      await paymentServices.reserveByBucket(
                          reservationId: bookingModel.id,
                          context: context);
                      Get.back();
                    },
                    child: Obx(
                          ()=> Container(
                          width: 300,
                          padding: const EdgeInsets.only(
                              top: 9, bottom: 9, right: 7, left: 7),
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            color: AppConstants.primaryColor,
                            border: Border.all(
                                color: AppConstants.primaryColor, width: 2.0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Center(
                              child: Column(
                            children: [
                              CustomText(
                                text: "purchasingByWallet".tr,
                                fontSize: 18,
                                textDirection: TextDirection.ltr,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              CustomText(
                                text:
                                    "${"walletBalance".tr} : ${homeController.studentProfile[0].bucket}",
                                fontSize: 14,
                                textDirection: TextDirection.ltr,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ))),
                    ),
                  ),
                  const SizedBox(height: 40,),

                ],
              ),
            ),
          ),
        ),
      ),
      enableDrag: true,
      backgroundColor: Colors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
    );
  }
}
