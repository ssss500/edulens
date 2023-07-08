import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/routes/routes_names.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/home/home_controllers.dart';
import '../../../controllers/profile_teacher_controller.dart';
import '../../../controllers/subject_teacher_controller.dart';

// <<<<<<< HEAD
import '../mobile/subject_teacher_view_mobile.dart';

// =======
// >>>>>>> origin/master
import '../../widget/card_image_teacher.dart';
import '../../widget/custom_image_url_view.dart';
import '../../widget/custom_list_view.dart';
import '../mobile/custom_video_player_for_ads_covers.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  // final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ConnectivityWidget(
        onlineCallback: () {
          controller.refresherMethod();
        },
        builder: (context, isOnline) => Column(
              children: [
                CustomText(
                  text: 'الصفحة الرئيسية',
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.right,
                  fontSize: size.width * .02,
                  color: AppConstants.lightPrimaryColor,
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // CustomText(
                        //   text: 'احدث العروض',
                        //   fontWeight: FontWeight.bold,
                        //   textAlign: TextAlign.right,
                        //   fontSize: size.width*.015,
                        //   color: Colors.black,
                        // ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Obx(
                          () => controller.covers.isNotEmpty
                              ? SizedBox(
                            height: size.height / 3.1,
                            width: size.width / 1.2,
                                child: CarouselSlider.builder(
                                    itemCount: controller.covers.length,
                                    itemBuilder: (BuildContext context,
                                            int itemIndex, int pageViewIndex) =>
                                        Container(
                                      // padding: const EdgeInsets.all(50),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Colors.grey.shade300,
                                      ),
                                      child: controller.covers[itemIndex].image
                                                  .toString()
                                                  .substring(controller
                                                          .covers[itemIndex]
                                                          .image
                                                          .toString()
                                                          .length -
                                                      3)
                                                  .toLowerCase() ==
                                              "mp4"
                                          ? VideoPlay(
                                              pathh:
                                                  "https://edu-lens.com/images/covers/${controller.covers[itemIndex].image.toString()}")
                                          :
                                              CustomImageUrlView(
                                                  fit: BoxFit.fill,
                                                  image:
                                                      "https://edu-lens.com/images/covers/${controller.covers[itemIndex].image}",
                                                ),

                                    ),
                                    options: CarouselOptions(
                                      autoPlay: kDebugMode ? false : true,
                                      enlargeCenterPage: true,
                                      height: size.height / 3,
                                      viewportFraction: 0.3,
                                      aspectRatio: 2.0,
                                      initialPage: 2,
                                    ),
                                  ),
                              )
                              : const SizedBox(),
                        ),
                        SizedBox(
                          height: size.height * .03,
                        ),
                        CustomText(
                          text: 'المواد',
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.right,
                          fontSize: size.width * .015,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Container(
                          padding: EdgeInsets.only(right: size.width * .035),
                          height: 155,
                          width: size.width / 1.5,
                          child: Obx(
                            () => controller.subject.isEmpty &&
                                    controller.apiLoadingSubject.value
                                ? const SizedBox(
                                    height: 170,
                                    child: Center(
                                        child: CircularProgressIndicator(
                                      color: AppConstants.lightPrimaryColor,
                                    )))
                                : controller.subject.isEmpty &&
                                        !controller.apiLoadingSubject.value
                                    ? const SizedBox()
                                    : SizedBox(
                                        height: 130,
                                        child: CustomListView(
                                            itemCount:
                                                controller.subject.length,
                                            axis: Axis.horizontal,
                                            scroll: true,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () async {
                                                  final SubjectTeacherController
                                                      subjectController =
                                                      Get.put(
                                                          SubjectTeacherController());
                                                  subjectController
                                                      .indexSubject = index;
                                                  subjectController
                                                      .getSubjectTeacherMethod();
                                                  Get.toNamed(
                                                      RoutesNames.subjectView);
                                                },
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      "https://edu-lens.com/images/subjects/${controller.subject[index].image!}",
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    width: 130,
                                                    height: 130,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  placeholder: (context, url) =>
                                                      const SizedBox(
                                                    width: 130,
                                                    child: Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: AppConstants
                                                            .lightPrimaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Icon(Icons
                                                          .broken_image_rounded),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      CustomText(
                                                        text:
                                                            "imageErrorMessage"
                                                                .tr,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        CustomText(
                          text: 'المدرسين',
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.right,
                          fontSize: size.width * .015,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        GetX<HomeController>(
                            builder: (controller) => controller
                                        .teachers.isEmpty &&
                                    controller.apiLoadingTeacher.value
                                ? const SizedBox(
                                    height: 170,
                                    child: Center(
                                        child: CircularProgressIndicator(
                                      color: AppConstants.lightPrimaryColor,
                                    )))
                                : controller.teachers.isEmpty &&
                                        controller.apiLoadingTeacher.value ==
                                            false
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: Image.asset(
                                              'assets/images/mirage-no-comments.png',
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: CustomText(
                                              text:
                                                  "لا يوجد بيانات للعرض يمكن التواصل معا الدعم الفني من هنا",
                                              fontSize: 24,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  icon: const Icon(Icons.phone),
                                                  iconSize: 25,
                                                  onPressed: () {
                                                    launchUrl(Uri(
                                                        scheme: 'tel',
                                                        path: "01092884278"));
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text(
                                                  "01092884278",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    final Uri url = Uri.parse(
                                                        'whatsapp://send?phone=+201092884278');

                                                    await launchUrl(url);
                                                  },
                                                  child: Image.asset(
                                                    "assets/images/whatsapp.png",
                                                    height: 35,
                                                    width: 35,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  icon: const Icon(Icons.phone),
                                                  iconSize: 25,
                                                  onPressed: () {
                                                    launchUrl(Uri(
                                                        scheme: 'tel',
                                                        path: "01153070885"));
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text(
                                                  "01153070885",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    final Uri url = Uri.parse(
                                                        'whatsapp://send?phone=+201153070885');

                                                    await launchUrl(url);
                                                  },
                                                  child: Image.asset(
                                                    "assets/images/whatsapp.png",
                                                    height: 35,
                                                    width: 35,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  icon: const Icon(Icons.phone),
                                                  iconSize: 25,
                                                  onPressed: () {
                                                    launchUrl(Uri(
                                                        scheme: 'tel',
                                                        path: "01099613267"));
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text(
                                                  "01099613267",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    final Uri url = Uri.parse(
                                                        'whatsapp://send?phone=+201099613267');

                                                    await launchUrl(url);
                                                  },
                                                  child: Image.asset(
                                                    "assets/images/whatsapp.png",
                                                    height: 35,
                                                    width: 35,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(right: 35.0),
                                        child: SizedBox(
                                          height: size.height * 1.35,
                                          width: size.width / 1.5,
                                          child: GridView.builder(
                                            itemCount:
                                                controller.teachers.length > 8
                                                    ? MediaQuery.of(context)
                                                                .size
                                                                .shortestSide <
                                                            600
                                                        ? 8
                                                        : 9
                                                    : controller
                                                        .teachers.length,
                                            gridDelegate:
                                              const   SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  5,
                                              childAspectRatio: (0.8),
                                            ),
                                            itemBuilder: (_, index) => InkWell(
                                              child: Hero(
                                                  tag: "imageTeacher$index",
                                                  child: CardImageTeacher(
                                                    name: true,
                                                    dateTeacher: controller
                                                        .teachers[index],
                                                    // image:
                                                    //     "https://edu-lens.com/images/teachers/${controller.teachers[index].image}",
                                                  )),
                                              onTap: () {
                                                ProfileTeacherController
                                                    profileTeacherController =
                                                    Get.put(
                                                        ProfileTeacherController());

                                                profileTeacherController
                                                        .dateTeacher =
                                                    controller.teachers[index];

                                                profileTeacherController.index =
                                                    index;
                                                profileTeacherController
                                                    .getCoursesAndExamAndBookings();

                                                Get.toNamed(
                                                    RoutesNames.subjectTeacher);
                                              },
                                            ),
                                            padding: const EdgeInsets.all(10),
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                          ),
                                        ),
                                      )),
                      ],
                    ),
                  ),
                ),
              ],
            ));
  }
}
