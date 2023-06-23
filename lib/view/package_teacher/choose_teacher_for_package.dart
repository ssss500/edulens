import 'dart:ui';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/controllers/package_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/widget/card_image_teacher.dart';
import 'package:edu_lens/view/widget/custom_app_bar.dart';
import 'package:edu_lens/view/widget/custom_buttom.dart';
import 'package:edu_lens/view/widget/custom_dialog/snackBar.dart';
import 'package:edu_lens/view/widget/custom_list_view.dart';
import 'package:edu_lens/view/widget/custom_loading.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseTeacherForPackages extends StatelessWidget {
  ChooseTeacherForPackages({Key? key}) : super(key: key);
  HomeController homeController = Get.find();
  PackageController packageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        title: packageController.selectedPackage.name,
      floatingActionButton:Obx(
          ()=> FloatingActionButton.extended(
          onPressed: () async {
            if(packageController.checkList.length<packageController.selectedPackage.chapterNumber){
              // debugPrint("ok");
              showCustomSnackBar(
                  context: Get.context,
                  title: "note".tr,
                  deck: "يجب اكمال عدد الفصول المطلوبة",
                  contentType: ContentType.warning);
            }else{
              Get.dialog(CustomLoading());
              packageController.puyChapter();
              Get.back();
            }

          },
          label:   Text("عدد الفصول المحددة ${packageController.checkList.length} من ${packageController.selectedPackage.chapterNumber}"),
          backgroundColor: AppConstants.primaryColor,
        ),
      ),

    widget: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                child: Obx(
                  () => homeController.subject.isEmpty
                      ? const SizedBox(
                          height: 170,
                          child: Center(
                              child: CircularProgressIndicator(
                            color: AppConstants.lightPrimaryColor,
                          )))
                      : SizedBox(
                          height: 170,
                          child: CustomListView(
                              itemCount: homeController.subject.length,
                              axis: Axis.horizontal,
                              scroll: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () async {
                                      debugPrint(
                                          "homeController.subject[index].id! :${homeController.subject[index].id!}");
                                      packageController.indexSubject = index;
                                      packageController.subjectTeachers.clear();
                                      debugPrint(
                                          "packageController.subjectId: ${packageController.subjectId.value}");
                                      packageController
                                          .getSubjectTeacherMethod();
                                    },
                                    child: Obx(
                                      () => Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            color: homeController
                                                        .subject[index].id ==
                                                    packageController
                                                        .subjectId.value
                                                ? AppConstants.lightPrimaryColor
                                                : AppConstants.primaryColor,
                                          ),
                                          padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 8,
                                              bottom: 5),
                                          margin: const EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                              top: 5,
                                              bottom: 5),
                                          child: CustomText(
                                            text: homeController
                                                .subject[index].name
                                                .toString(),
                                            color: Colors.white,
                                          )),
                                    ));
                              }),
                        ),
                ),
              ),
              ConnectivityWidget(
                onlineCallback: () {
                  packageController.getSubjectTeacherMethod();
                },
                builder: (context, isOnline) =>
                    Obx(() => packageController.subjectTeachers.isEmpty
                        ? const SizedBox(
                            height: 170,
                            child: Center(
                                child: CircularProgressIndicator(
                              color: AppConstants.lightPrimaryColor,
                            )))
                        : GridView.builder(
                            itemCount: packageController.subjectTeachers.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  MediaQuery.of(context).size.shortestSide < 600
                                      ? 2
                                      : 3,
                              childAspectRatio: (0.8),
                            ),
                            itemBuilder: (_, index) => InkWell(
                              child: CardImageTeacher(
                                dateTeacher:
                                    packageController.subjectTeachers[index],
                                name: true,
                                love: false,
                              ),
                              onTap: () {
                                packageController.getChapters(packageController
                                    .subjectTeachers[index].id);
                                packageController.bottomSheetSelectCourse(
                                    context: context);
                              },
                            ),
                            padding: const EdgeInsets.all(10),
                            shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                          )),
              )
            ],
          ),
        ));
  }
}
