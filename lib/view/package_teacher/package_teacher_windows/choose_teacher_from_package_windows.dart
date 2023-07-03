import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home/home_controllers.dart';
import '../../../controllers/package_controller.dart';
import '../../../helper/app_constants.dart';
import '../../widget/card_image_teacher.dart';
import '../../widget/custom_app_bar.dart';
import '../../widget/custom_background.dart';
import '../../widget/custom_dialog/snackBar.dart';
import '../../widget/custom_list_view.dart';
import '../../widget/custom_loading.dart';
import '../../widget/custom_text.dart';

class ChooseTeacherFromPackageWindows extends GetView<PackageController> {
  ChooseTeacherFromPackageWindows({Key? key}) : super(key: key);
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(
            () => FloatingActionButton.extended(
          onPressed: () async {
            if (controller.checkList.length <
                controller.selectedPackage.chapterNumber) {
              showCustomSnackBar(
                  context: Get.context,
                  title: "note".tr,
                  deck: "يجب اكمال عدد الفصول المطلوبة",
                  contentType: ContentType.warning);
            } else {
              Get.dialog(const CustomLoading());
              controller.puyChapter();
              Get.back();
            }
          },
          label: Text(
              "عدد الفصول المحددة ${controller.checkList.length} من ${controller.selectedPackage.chapterNumber}"),
          backgroundColor: AppConstants.primaryColor,
        ),
      ),
      body: CustomBackground(
        child:SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back_ios)),
                    SizedBox(width: MediaQuery.sizeOf(context).width*0.4,),
                    Text(
                        controller.selectedPackage.name,
                      style: const TextStyle(color: AppConstants.lightPrimaryColor, fontSize: 23),
                    ),
                  ],
                ),
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
                                      controller.indexSubject = index;
                                      controller.subjectTeachers.clear();
                                      debugPrint(
                                          "packageController.subjectId: ${controller.subjectId.value}");
                                      controller.getSubjectTeacherMethod();
                                    },
                                    child: Obx(
                                      () => Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(14),
                                          color:
                                              homeController.subject[index].id ==
                                                      controller.subjectId.value
                                                  ? AppConstants.lightPrimaryColor
                                                  : AppConstants.primaryColor,
                                        ),
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 8,
                                            bottom: 5),
                                        margin: const EdgeInsets.only(
                                            left: 8, right: 8, top: 5, bottom: 5),
                                        child: CustomText(
                                          text: homeController.subject[index].name
                                              .toString(),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                  ),
                ),
                ConnectivityWidget(
                  onlineCallback: () {
                    controller.getSubjectTeacherMethod();
                  },
                  builder: (context, isOnline) =>
                      Obx(() => controller.subjectTeachers.isEmpty
                          ? const SizedBox(
                              height: 170,
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: AppConstants.lightPrimaryColor,
                              )))
                          : GridView.builder(
                              itemCount: controller.subjectTeachers.length,
                              gridDelegate:
                                 const  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    4,
                                childAspectRatio: (0.8),
                              ),
                              itemBuilder: (_, index) => InkWell(
                                child: CardImageTeacher(
                                  dateTeacher: controller.subjectTeachers[index],
                                  name: true,
                                  love: false,
                                ),
                                onTap: () {
                                  controller.getChapters(
                                      controller.subjectTeachers[index].id);
                                  controller.bottomSheetSelectCourse(
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
          )),
    );
  }
}
