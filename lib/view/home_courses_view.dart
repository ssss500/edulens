import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/controllers/home_courses_controller.dart';
import 'package:edu_lens/controllers/video_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/buttom_sheet_paid.dart';
import 'package:edu_lens/view/video/video_view.dart';
import 'package:edu_lens/view/widget/custom_app_bar.dart';
import 'package:edu_lens/view/widget/custom_buttom.dart';
import 'package:edu_lens/view/widget/custom_image_url_view.dart';
import 'package:edu_lens/view/widget/custom_list_view.dart';
import 'package:edu_lens/view/widget/custom_loading.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCoursesView extends StatelessWidget {
  HomeCoursesController homeCoursesController =
      Get.put(HomeCoursesController());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    return CustomAppBar(
        title: "courses".tr,
        // key: bottomSheetKey,
        widget: ConnectivityWidget(
          onlineCallback: () {
            homeCoursesController.getChapters();
          },
          builder: (context, isOnline) => Obx(
            () => homeCoursesController.chapters.isEmpty
                ? const SizedBox(
                    height: 170,
                    child: Center(
                        child: CircularProgressIndicator(
                      color: AppConstants.lightPrimaryColor,
                    )))
                : CustomListView(
                    padding: 0,
                    scroll: true,
                    itemCount: homeCoursesController.chapters.length,
                    itemBuilder: (BuildContext context, int indexChapters) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.black45,
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
                                ()=> Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                              text: homeCoursesController
                                                  .chapters[indexChapters].name!,
                                              color: Colors.white,
                                              textAlign: TextAlign.start,
                                              alignment: Alignment.centerRight,
                                              fontSize: 25,
                                            ),
                                          ),
                                          if (!homeController.chapterPaid.any(
                                              (element) =>
                                                  element.id ==
                                                  homeCoursesController
                                                      .chapters[indexChapters]
                                                      .id))
                                            if (!homeController
                                                .appleAndGoogleBool.value)
                                              const SizedBox(
                                                height: 5,
                                              ),
                                          if (!homeController.chapterPaid.any(
                                              (element) =>
                                                  element.id ==
                                                  homeCoursesController
                                                      .chapters[indexChapters]
                                                      .id))
                                            if (!homeController
                                                .appleAndGoogleBool.value)
                                              CustomText(
                                                text:
                                                    "سعر الفصل كامل :  ${homeCoursesController.chapters[indexChapters].cost!} جنيها",
                                                textAlign: TextAlign.start,
                                                alignment: Alignment.centerRight,
                                                color: Colors.white,
                                                fontSize: 14,
                                              )
                                        ],
                                      ),
                                    ),
                                    if (!homeController.chapterPaid.any(
                                        (element) =>
                                            element.id ==
                                            homeCoursesController
                                                .chapters[indexChapters].id))
                                      if (!homeController
                                          .appleAndGoogleBool.value)
                                        CustomButton(
                                          height: 50,
                                          width: widthScreen * 0.2,
                                          function: () {
                                            BottomSheetPey
                                                .bottomSheetPaidForChapter(
                                              dataChapter: homeCoursesController
                                                  .chapters[indexChapters],
                                              context: context,
                                            );
                                          },
                                          text: "شراء الفصل كامل",
                                          sizeText: 15,
                                        )
                                      else
                                        const SizedBox()
                                    else
                                      if (!homeController
                                          .appleAndGoogleBool.value)
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.green.shade400,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CustomText(
                                            text: "تم الشراء",
                                            color: Colors.white,
                                            alignment: Alignment.center,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ),
                            Obx(
                              () => CustomListView(
                                  padding: 0,
                                  scroll: false,
                                  itemCount: homeCoursesController
                                      .chapters[indexChapters].lectures!.length,
                                  itemBuilder: (BuildContext context,
                                      int indexLectures) {
                                    final item = homeCoursesController
                                        .chapters[indexChapters].lectures;
                                    return InkWell(
                                      onTap: () async {
                                        // debugPrint(homeCoursesController
                                        //     .chapters[indexChapters]
                                        //     .lectures![indexLectures]
                                        //     .id
                                        //     .toString());
                                        if (homeController
                                                .appleAndGoogleBool.value ||
                                            homeController.lecturePaid.any(
                                                (element) =>
                                                    element.id ==
                                                    homeCoursesController
                                                        .chapters[indexChapters]
                                                        .lectures![
                                                            indexLectures]
                                                        .id) ||
                                            item[indexLectures].cost == 0 ||
                                            homeController
                                                    .studentProfile[0].phone ==
                                                '01022535966'||homeController.chapterPaid.any(
                                                (element) =>
                                            element.id ==
                                                homeCoursesController
                                                    .chapters[indexChapters].id)) {
                                          Get.dialog(CustomLoading());
                                          // await  homeCoursesController.controller.initialise();
                                          homeCoursesController.indexLectures =
                                              indexLectures;
                                          homeCoursesController.indexChapters =
                                              indexChapters;
                                          VideoController videoController =
                                              Get.put(VideoController());
                                          await videoController.openVideo();
                                          videoController.getVideoExtensions();
                                          Get.back();
                                          Get.to(() => VideoView(
                                                title: homeCoursesController
                                                    .chapters[indexChapters]
                                                    .lectures![indexLectures]
                                                    .name,
                                              ));
                                        } else {
                                          BottomSheetPey
                                              .bottomSheetPaidForLecture(
                                            dataLecture: homeCoursesController
                                                .chapters[indexChapters]
                                                .lectures![indexLectures],
                                            context: context,
                                          );
                                        }
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 9,
                                            right: 9,
                                            bottom: 10,
                                            top: 5),
                                        padding: const EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                            bottom: 10,
                                            top: 5),
                                        decoration: BoxDecoration(
                                          color: AppConstants.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          children: [
                                            // CustomImageUrlViewNotZoom(
                                            //   image:
                                            //       "https://images.wallpaperscraft.com/image/single/moon_surface_relief_409277_1280x720.jpg",
                                            // ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            CustomText(
                                              text:
                                                  "${item![indexLectures].name}",
                                              color: Colors.white,
                                              fontSize: 23,
                                            ),
                                            if(!homeController.chapterPaid.any(
                                                    (element) =>
                                                element.id ==
                                                    homeCoursesController
                                                        .chapters[indexChapters].id))
                                            if (!homeController
                                                .appleAndGoogleBool.value)
                                              const SizedBox(
                                                height: 9,
                                              ),
                                           Obx(()=> !homeController.chapterPaid.any(
                                                    (element) =>
                                                element.id ==
                                                    homeCoursesController
                                                        .chapters[indexChapters].id)?
                                             !homeController
                                                .appleAndGoogleBool.value?
                                              Obx(
                                                    ()=> CustomText(
                                                  text: homeController.lecturePaid
                                                          .any((element) =>
                                                              element.id ==
                                                              homeCoursesController
                                                                  .chapters[
                                                                      indexChapters]
                                                                  .lectures![
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
                                                              homeCoursesController
                                                                  .chapters[
                                                                      indexChapters]
                                                                  .lectures![
                                                                      indexLectures]
                                                                  .id)
                                                      ? Colors.black54
                                                      : item[indexLectures]
                                                                  .cost ==
                                                              0
                                                          ? Colors.green.shade800
                                                          : Colors.red.shade300,
                                                  fontSize: 16,
                                                ),
                                              ):SizedBox():SizedBox()),

                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      );
                    }),
          ),
        ));
  }
}
