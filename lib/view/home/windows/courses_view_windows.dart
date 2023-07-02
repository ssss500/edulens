import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/view/widget/custom_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_courses_controller.dart';
import '../../../controllers/video_controller.dart';
import '../../../helper/app_constants.dart';
import '../../../routes/routes_names.dart';
import '../../buttom_sheet_paid.dart';
import '../../widget/custom_buttom.dart';
import '../../widget/custom_list_view.dart';
import '../../widget/custom_loading.dart';
import '../../widget/custom_text.dart';

class CoursesViewWindows extends GetView<HomeCoursesController> {
  const CoursesViewWindows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    final widthScreen = MediaQuery.sizeOf(context).width;
    return CustomBackground(
        child: ConnectivityWidget(
      onlineCallback: () {
        controller.getChapters();
      },
      builder: (context, isOnline) => Obx(
        () => controller.chapters.isEmpty
            ? const SizedBox(
                child: Center(
                    child: CircularProgressIndicator(
                  color: AppConstants.lightPrimaryColor,
                )))
            : Row(

              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        )),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     const SizedBox(height: 15,),
                      CustomText(
                        text:  "courses".tr,
                        color: AppConstants.lightPrimaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: CustomListView(
                              padding: 0,
                              scroll: true,
                              itemCount: controller.chapters.length,
                              itemBuilder: (BuildContext context, int indexChapters) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  width: widthScreen,
                                  margin: const EdgeInsets.only(
                                      left: 9, right: 9, bottom: 14, top: 15),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 18.0, top: 15, bottom: 10, left: 18),
                                        child: Obx(
                                          () => Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: widthScreen * 0.63,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 40,
                                                      child: CustomText(
                                                        text: controller
                                                            .chapters[indexChapters].name,
                                                        color: Colors.black,
                                                        textAlign: TextAlign.start,
                                                        alignment: Alignment.centerRight,
                                                        fontSize: 25,
                                                      ),
                                                    ),
                                                    if (!homeController.chapterPaid.any(
                                                        (element) =>
                                                            element.id ==
                                                            controller
                                                                .chapters[indexChapters].id))
                                                      if (!homeController
                                                          .appleAndGoogleBool.value)
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                    if (!homeController.chapterPaid.any(
                                                        (element) =>
                                                            element.id ==
                                                            controller
                                                                .chapters[indexChapters].id))
                                                      if (!homeController
                                                          .appleAndGoogleBool.value)
                                                        CustomText(
                                                          text:
                                                              "سعر الفصل كامل :  ${controller.chapters[indexChapters].cost} جنيها",
                                                          textAlign: TextAlign.start,
                                                          alignment: Alignment.centerRight,
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                        )
                                                  ],
                                                ),
                                              ),
                                              if (!homeController.chapterPaid.any((element) =>
                                                  element.id ==
                                                  controller.chapters[indexChapters].id))
                                                if (!homeController.appleAndGoogleBool.value)
                                                  CustomButton(
                                                    height: 33,
                                                    width: widthScreen * 0.08,
                                                    borderRadius: 10,
                                                    function: () {
                                                      BottomSheetPey
                                                          .bottomSheetPaidForChapter(
                                                        dataChapter: controller
                                                            .chapters[indexChapters],
                                                        context: context,
                                                      );
                                                    },
                                                    text: "شراء الفصل كامل",
                                                    sizeText: 15,
                                                  )
                                                else
                                                  const SizedBox()
                                              else if (!homeController
                                                  .appleAndGoogleBool.value)
                                                Container(
                                                  height: 30,
                                                  width: widthScreen * 0.08,
                                                  decoration: BoxDecoration(
                                                      color: Colors.green.shade400,
                                                      borderRadius:
                                                          BorderRadius.circular(10)),
                                                  child: CustomText(
                                                    text: "تم الشراء",
                                                    color: Colors.white,
                                                    alignment: Alignment.center,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => SizedBox(
                                          width: widthScreen/1.15,
                                          height: MediaQuery.sizeOf(context).height/9,
                                          child: CustomListView(
                                              padding: 0,
                                              scroll: false,
                                              axis: Axis.horizontal,
                                              itemCount: controller
                                                  .chapters[indexChapters].lectures.length,
                                              itemBuilder:
                                                  (BuildContext context, int indexLectures) {
                                                final item =
                                                    controller.chapters[indexChapters].lectures;
                                                return InkWell(
                                                  onTap: () async {
                                                    // debugPrint(controller
                                                    //     .chapters[indexChapters]
                                                    //     .lectures![indexLectures]
                                                    //     .id
                                                    //     .toString());
                                                    if (homeController
                                                            .appleAndGoogleBool.value ||
                                                        homeController.lecturePaid.any(
                                                            (element) =>
                                                                element.id ==
                                                                controller
                                                                    .chapters[indexChapters]
                                                                    .lectures[indexLectures]
                                                                    .id) ||
                                                        item[indexLectures].cost == 0 ||
                                                        homeController
                                                                .studentProfile[0].phone ==
                                                            '01125705024' ||
                                                        homeController.chapterPaid.any(
                                                            (element) =>
                                                                element.id ==
                                                                controller
                                                                    .chapters[indexChapters]
                                                                    .id)) {
                                                      Get.dialog(const CustomLoading());
                                                      // await  controller.controller.initialise();
                                                      controller.indexLectures = indexLectures;
                                                      controller.indexChapters = indexChapters;
                                                      VideoController videoController =
                                                          Get.find();
                                                      await videoController.openVideo();
                                                      videoController.getVideoExtensions();
                                                     // Get.back();
                                                      Get.offNamed(RoutesNames.videoView,
                                                          arguments: {
                                                            'title': controller
                                                                .chapters[indexChapters]
                                                                .lectures[indexLectures]
                                                                .name,
                                                          });
                                                    } else {
                                                      BottomSheetPey.bottomSheetPaidForLecture(
                                                        dataLecture: controller
                                                            .chapters[indexChapters]
                                                            .lectures[indexLectures],
                                                        context: context,
                                                      );
                                                    }
                                                  },
                                                  child: Container(
                                                    margin: const EdgeInsets.only(
                                                        left: 9, right: 9, bottom: 10, top: 5),
                                                    padding: const EdgeInsets.only(
                                                        left: 5, right: 5, bottom: 10, top: 5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.withOpacity(0.4),
                                                          spreadRadius: 2,
                                                          blurRadius: 4,
                                                        )
                                                      ],
                                                      borderRadius: BorderRadius.circular(20.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        SizedBox(
                                                          width:widthScreen/10,
                                                          child: CustomText(
                                                            textOverflow: TextOverflow.ellipsis,
                                                            text: item[indexLectures].name,
                                                            color: Colors.black,
                                                            fontSize: widthScreen*.01,
                                                          ),
                                                        ),
                                                        if (!homeController.chapterPaid.any(
                                                            (element) =>
                                                                element.id ==
                                                                controller
                                                                    .chapters[indexChapters]
                                                                    .id))
                                                          if (!homeController
                                                              .appleAndGoogleBool.value)
                                                            const SizedBox(
                                                              height: 9,
                                                            ),
                                                        Obx(() => !homeController.chapterPaid
                                                                .any((element) =>
                                                                    element.id ==
                                                                    controller
                                                                        .chapters[indexChapters]
                                                                        .id)
                                                            ? !homeController
                                                                    .appleAndGoogleBool.value
                                                                ? Obx(
                                                                    () => CustomText(
                                                                      text: homeController
                                                                              .lecturePaid
                                                                              .any((element) =>
                                                                                  element.id ==
                                                                                  controller
                                                                                      .chapters[
                                                                                          indexChapters]
                                                                                      .lectures[
                                                                                          indexLectures]
                                                                                      .id)
                                                                          ? "تم شراء المحاضرة"
                                                                          : item[indexLectures]
                                                                                      .cost ==
                                                                                  0
                                                                              ? "المحاضرة مجانية"
                                                                              : "سعر المحاضرة: ${item[indexLectures].cost} جنيها ",
                                                                      color: homeController
                                                                              .lecturePaid
                                                                              .any((element) =>
                                                                                  element.id ==
                                                                                  controller
                                                                                      .chapters[
                                                                                          indexChapters]
                                                                                      .lectures[
                                                                                          indexLectures]
                                                                                      .id)
                                                                          ? Colors.black54
                                                                          : item[indexLectures]
                                                                                      .cost ==
                                                                                  0
                                                                              ? Colors.green
                                                                                  .shade800
                                                                              : Colors
                                                                                  .red.shade300,
                                                                      fontSize: 16,
                                                                    ),
                                                                  )
                                                                : const SizedBox()
                                                            : const SizedBox()),

                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
      ),
    ));
  }
}
