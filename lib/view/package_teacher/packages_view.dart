import 'dart:ui';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/controllers/package_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/routes/routes_names.dart';
import 'package:edu_lens/view/package_teacher/choose_teacher_for_package.dart';
import 'package:edu_lens/view/widget/custom_app_bar.dart';
import 'package:edu_lens/view/widget/custom_buttom.dart';
import 'package:edu_lens/view/widget/custom_dialog/snackBar.dart';
import 'package:edu_lens/view/widget/custom_image_url_view.dart';
import 'package:edu_lens/view/widget/custom_list_view.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackagesView extends GetView<PackageController> {
 const PackagesView({Key? key}) : super(key: key);
//PackageController packageController=Get.find();
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        title: "packagesText".tr,
        widget: ConnectivityWidget(
          onlineCallback: () {
            controller.getPackages();
          },
          builder: (context, isOnline) =>
          Obx(()=>
          controller.plansList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppConstants.lightPrimaryColor,
                  ))
              :Padding(
            padding: const EdgeInsets.all(8.0),
            child:  CustomListView(
                itemCount: controller.plansList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    // padding: const EdgeInsets.only(right: 30,top: 20,bottom: 20,left: 20),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppConstants.primaryColor),
                        borderRadius: BorderRadius.circular(25)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 30, top: 20, bottom: 20, left: 20),
                          child: Column(
                            children: [
                              // SizedBox(height: 20,),
                              CustomText(
                                text:  controller.plansList[index].name,
                                fontSize: 30,
                                alignment: Alignment.centerRight,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomText(
                                text: "سعر الباقة ${controller.plansList[index].price} جنيها",
                                fontSize: 17,
                                color: Colors.green,
                                alignment: Alignment.centerRight,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomText(
                                text: "عدد الفصول المتاحة لك: ${controller.plansList[index].chapterNumber} فصول",
                                fontSize: 17,
                                color: Colors.red.shade500,
                                alignment: Alignment.centerRight,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                function: () {
                                  HomeController homeController=Get.put(HomeController());
                                  if(controller.plansList[index].price<=homeController.studentProfile[0].bucket!){
                                    controller.checkList.value =
                                              [];
                                    controller.selectedPackage =
                                    controller
                                                  .plansList[index];
                                          Get.toNamed(RoutesNames.chooseTeacherForPackages);
                                        }else{
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
                      ),
                    ),
                  );
                },
              ),
          ),
          ),
        ));
  }
}
