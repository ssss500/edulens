import 'dart:ui';
import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home/home_controllers.dart';
import '../../../controllers/package_controller.dart';
import '../../../custom_grid_view.dart';
import '../../../helper/app_constants.dart';
import '../../../routes/routes_names.dart';
import '../../widget/custom_buttom.dart';
import '../../widget/custom_dialog/snackBar.dart';
import '../../widget/custom_text.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class Packages extends GetView<PackageController> {
  const Packages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put(HomeController());
    debugPrint('fired');
    controller.getPackages();
    return Scaffold(
      body: ConnectivityWidget(
        onlineCallback: () {
          controller.getPackages();
        },
        builder: (context, isOnline) => Obx(
          () => controller.plansList.isEmpty
              ? const Center(
                  child: SizedBox(child: Text('لا توجد باقات حاليا'),))
              : Column(
                children: [
                  CustomText(
                    text: 'الباقات',
                    color: AppConstants.lightPrimaryColor, fontSize: 24,fontWeight: FontWeight.bold,
                  ),
                  Container(
                      height: MediaQuery.sizeOf(context).height/1.2,
                      width: MediaQuery.sizeOf(context).width / 1.8,
                      child: CustomGridView(
                        itemCount: controller.plansList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            // padding: const EdgeInsets.only(right: 30,top: 20,bottom: 20,left: 20),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 40),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppConstants.primaryColor),
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 30, top: 0, bottom: 0, left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //     SizedBox(height: 30,),
                                  CustomText(
                                    text: controller.plansList[index].name,
                                    fontSize: 30,
                                    alignment: Alignment.center,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomText(
                                    text:
                                        "سعر الباقة ${controller.plansList[index].price} جنيها",
                                    fontSize: 17,
                                    color: Colors.green,
                                    alignment: Alignment.center,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomText(
                                    text:
                                        "عدد الفصول المتاحة لك: ${controller.plansList[index].chapterNumber} فصول",
                                    fontSize: 17,
                                    color: Colors.red.shade500,
                                    alignment: Alignment.center,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomButton(
                                    function: () {
                                      HomeController homeController =
                                          Get.put(HomeController());
                                      if (controller.plansList[index].price <=
                                          homeController
                                              .studentProfile[0].bucket!) {
                                        controller.checkList.value = [];
                                        controller.selectedPackage =
                                            controller.plansList[index];
                                        Get.toNamed(
                                            RoutesNames.chooseTeacherForPackages);
                                      } else {
                                        showCustomSnackBar(
                                            context: context,
                                            title: "note".tr,
                                            deck: "رصيدك لا يكفي قم بالشحن اولا",
                                            contentType: ContentType.warning);
                                      }
                                    },
                                    text: "choosePackagesText".tr,
                                    sizeText: 20,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
        ),
      ),
    );
  }
}
