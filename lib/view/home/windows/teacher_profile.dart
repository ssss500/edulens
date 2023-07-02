import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:edu_lens/view/widget/custom_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../controllers/home/home_controllers.dart';
import '../../../controllers/home_courses_controller.dart';
import '../../../controllers/profile_teacher_controller.dart';
import '../../../controllers/quiz/question_month_controller.dart';
import '../../../helper/app_constants.dart';
import '../../../routes/routes_names.dart';
import '../../buttom_sheet_paid.dart';
import '../../home_courses_view.dart';
import '../../widget/CustomCardMonthExam.dart';
import '../../widget/card_image_teacher.dart';
import '../../widget/custom_card_curses.dart';
import '../../widget/custom_dialog/snackBar.dart';
import '../../widget/custom_social_media_icons.dart';
import '../../widget/custom_text.dart';

class TeacherProfile extends GetView<ProfileTeacherController> {
  const TeacherProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
  // final ProfileTeacherController profileTeacherController = Get.find();
    final homeController = Get.put(HomeController());

    return CustomBackground(
        child: ConnectivityWidget(
            onlineCallback: () {
             controller.getCoursesAndExamAndBookings();
            },
            builder: (context, isOnline) => Stack(
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child:
                               IconButton(
                                  onPressed: () {
                                    controller.cleanData();

                                    Get.back();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                  )),

                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                )
                              ]),
                          width: widthScreen / 2,
                          height: heightScreen * 0.21,
                          child: Row(
                            children: [
                              Hero(
                                tag:
                                    "imageTeacher${controller.index}",
                                child: CardImageTeacher(
                                  dateTeacher:
                                     controller.dateTeacher,
                                  width: widthScreen * 0.1,
                                ),
                              ),
                              SizedBox(width: widthScreen*0.02,),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text:
                                            "${controller.dateTeacher.firstName!} ${controller.dateTeacher.lastName!}",
                                        fontSize: 23,
                                        heightContainer:
                                            heightScreen * 0.20 / 5,
                                        widthContainer: widthScreen * 0.55,
                                        alignment: Alignment.centerRight,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      CustomText(
                                          text:
                                              "${controller.dateTeacher.description} ",
                                          fontSize: 18,
                                          alignment: Alignment.centerRight,
                                          color: Colors.black,
                                          heightContainer:
                                              (heightScreen * 0.20) / 5,
                                          widthContainer: widthScreen * 0.55,
                                          textAlign: TextAlign.start),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: widthScreen*0.05,),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      if (controller
                                          .dateTeacher.youtubeLink !=
                                          null ||
                                          controller
                                              .dateTeacher.youtubeLink !=
                                              "")
                                        SocialButton(
                                          function: () async {
                                            if (!await launchUrl(Uri.parse(
                                                controller
                                                    .dateTeacher
                                                    .youtubeLink!))) {
                                              throw 'Could not launch ';
                                            }
                                          },
                                          image: Image.asset(
                                              "assets/images/youtube.png"),
                                        ),
                                      SizedBox(
                                        width: widthScreen * .02,
                                      ),
                                      if (controller
                                                  .dateTeacher.phone !=
                                              null ||
                                          controller
                                                  .dateTeacher.phone !=
                                              "")
                                        SocialButton(
                                          function: () async {
                                            if (!await launchUrl(Uri.parse(
                                                "whatsapp://send?phone=+02${controller.dateTeacher.phone}"))) {
                                              throw 'Could not launch ';
                                            }
                                          },
                                          image: Image.asset(
                                              "assets/images/whatsapp.png"),
                                        ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: heightScreen * .02,
                                  ),
                                  Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      if (controller
                                          .dateTeacher.instaLink !=
                                          null ||
                                          controller
                                              .dateTeacher.instaLink !=
                                              "")
                                        SocialButton(
                                          function: () async {
                                            if (!await launchUrl(Uri.parse(
                                                controller
                                                    .dateTeacher.instaLink!))) {
                                              throw 'Could not launch ';
                                            }
                                          },
                                          image: Image.asset(
                                              "assets/images/instagram.png"),
                                        ),
                                      SizedBox(
                                        width: widthScreen * .02,
                                      ),
                                      if (controller
                                          .dateTeacher.faceLink !=
                                          null ||
                                          controller
                                              .dateTeacher.faceLink !=
                                              "")
                                        SocialButton(
                                          function: () async {
                                            if (!await launchUrl(Uri.parse(
                                                controller
                                                    .dateTeacher.faceLink!))) {
                                              throw 'Could not launch ';
                                            }
                                          },
                                          image: Image.asset(
                                              "assets/images/facebook.png"),
                                        ),

                                    ],
                                  )
                                ],
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: heightScreen * 0.293,
                      child: SizedBox(
                          height: heightScreen * 0.70,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Obx(() => controller
                                        .coursesTeacher.isEmpty
                                    ? !controller
                                            .loadingCoursesTeacher.value
                                        ? SizedBox(
                                            child: Center(
                                                child: Column(
                                            children: [
                                              Container(

                                                width: widthScreen,
                                                margin: const EdgeInsets.only(
                                                    left: 9,
                                                    right: 9,
                                                    bottom: 14,
                                                    top: 15),
                                                padding: const EdgeInsets.only(
                                                    left: 9,
                                                    right: 9,
                                                    bottom: 14,
                                                    top: 15),
                                                child: CustomText(
                                                  text: "courses".tr,
                                                  fontSize: 26,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                child: Image.asset(
                                                  'assets/images/mirage-no-comments.png',
                                                  height: 150,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: CustomText(
                                                  text: "لا يوجد بيانات للعرض",
                                                  fontSize: 24,
                                                ),
                                              ),
                                            ],
                                          )))
                                        : const SizedBox(
                                            height: 170,
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                              color: AppConstants
                                                  .lightPrimaryColor,
                                            )))
                                    : Column(
                                        children: [
                                          if (controller
                                              .coursesTeacher.isNotEmpty)
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          if (controller
                                              .coursesTeacher.isNotEmpty)
                                            Container(
                                              width: widthScreen,
                                              margin: const EdgeInsets.only(
                                                  left: 9,
                                                  right: 9,
                                                  bottom: 14,
                                                  top: 15),
                                              padding: const EdgeInsets.only(
                                                  left: 9,
                                                  right: 9,
                                                  bottom: 14,
                                                  top: 15),
                                              child: CustomText(
                                                text: "courses".tr,
                                                fontSize: 26,
                                                color: Colors.black,
                                              ),
                                            ),
                                          if (controller
                                              .coursesTeacher.isNotEmpty)
                                            SizedBox(
                                              width: widthScreen/2,
                                              child: GridView.builder(
                                                itemCount:
                                                controller
                                                        .coursesTeacher.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount:
                                                      MediaQuery.of(context)
                                                                  .size
                                                                  .shortestSide <
                                                              600
                                                          ? 2
                                                          : 3,
                                                  childAspectRatio: (0.8),
                                                ),
                                                itemBuilder: (_, index) =>
                                                    InkWell(
                                                  onTap: () {
                                                    HomeCoursesController
                                                        homeCourses = Get.put(
                                                            HomeCoursesController());
                                                    homeCourses.chapterId =
                                                    controller
                                                            .coursesTeacher[index]
                                                            .pivot!['course_id'];
                                                    homeCourses.getChapters();
                                                    Get.toNamed(RoutesNames.coursesFromHome);
                                                  },
                                                  child: CustomCardCurses(
                                                    image:
                                                        "https://edu-lens.com/images/courses/${controller.coursesTeacher[index].image}",
                                                    title:
                                                    controller
                                                            .coursesTeacher[index]
                                                            .name,
                                                  ),
                                                ),
                                                padding: const EdgeInsets.all(10),
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                              ),
                                            ),
                                        ],
                                      )),
                                Obx(() => Column(
                                      children: [
                                        if (controller
                                            .monthExamTeacher.isNotEmpty)
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        if (controller
                                            .monthExamTeacher.isNotEmpty)
                                          Container(
                                            decoration: BoxDecoration(

                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            width: widthScreen,
                                            margin: const EdgeInsets.only(
                                                left: 9,
                                                right: 9,
                                                bottom: 14,
                                                top: 15),
                                            padding: const EdgeInsets.only(
                                                left: 9,
                                                right: 9,
                                                bottom: 14,
                                                top: 15),
                                            child: CustomText(
                                              text: "monthExams".tr,
                                              fontSize: 26,
                                              color: Colors.black,
                                            ),
                                          ),
                                        if (controller
                                            .monthExamTeacher.isNotEmpty)
                                          SizedBox(
                                            width: widthScreen/2,
                                            child: GridView.builder(
                                              itemCount: controller
                                                  .monthExamTeacher.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount:
                                                    MediaQuery.of(context)
                                                                .size
                                                                .shortestSide <
                                                            600
                                                        ? 2
                                                        : 3,
                                                childAspectRatio: (0.8),
                                              ),
                                              itemBuilder: (_, index) {
                                                return InkWell(
                                                  child: Obx(
                                                    () => CustomCardMonthExam(
                                                      free: homeController
                                                              .appleAndGoogleBool
                                                              .value ||
                                                          homeController
                                                              .solvedExams
                                                              .any((element) =>
                                                                  element.id ==
                                                                      controller
                                                                      .monthExamTeacher[
                                                                          index]
                                                                      .id) ||
                                                          controller
                                                                  .monthExamTeacher[
                                                                      index]
                                                                  .cost ==
                                                              0,
                                                      cost:
                                                      controller
                                                              .monthExamTeacher[
                                                                  index]
                                                              .cost
                                                              .toString(),
                                                      image:
                                                          "https://edu-lens.com/images/teachers/${controller.dateTeacher.image}",
                                                      title:
                                                      controller
                                                              .monthExamTeacher[
                                                                  index]
                                                              .title,
                                                    ),
                                                  ),
                                                  onTap: () async {
                                                    if (homeController
                                                            .appleAndGoogleBool
                                                            .value ||
                                                        (controller.monthExamTeacher[index].cost ==
                                                                0 &&
                                                            homeController.solvedExams
                                                                .where((v) =>
                                                                    v.id ==
                                                                        controller
                                                                        .monthExamTeacher[
                                                                            index]
                                                                        .id)
                                                                .isEmpty) ||
                                                        homeController
                                                                .studentProfile[0]
                                                                .phone ==
                                                            '01022535966') {
                                                      controller
                                                          .goToQuiz(index);
                                                    } else if (homeController
                                                        .solvedExams
                                                        .where((v) =>
                                                            v.id ==
                                                                controller
                                                                .monthExamTeacher[
                                                                    index]
                                                                .id)
                                                        .isEmpty) {
                                                      BottomSheetPey
                                                          .bottomSheetPaidForMonthExam(
                                                        dataMonthExam:
                                                        controller
                                                                    .monthExamTeacher[
                                                                index],
                                                        context: context,
                                                      );
                                                    }
                                                    else if (
                                                    homeController
                                                            .solvedExams
                                                            .where((v) => v.id == controller.monthExamTeacher[index].id)
                                                            .first
                                                            .status ==
                                                        0) {
                                                      controller
                                                          .goToQuiz(index);
                                                    } else {
                                                      showCustomSnackBar(
                                                          context: context,
                                                          title: "note".tr,
                                                          deck:
                                                              "تم حل الامتحان من قبل",
                                                          contentType: ContentType
                                                              .failure);
                                                    }
                                                  },
                                                );
                                              },
                                              padding: const EdgeInsets.all(10),
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                            ),
                                          ),
                                      ],
                                    )),

                                ///booking
                                if (!homeController.appleAndGoogleBool.value)
                                  Obx(() => Column(
                                        children: [
                                          if (controller
                                              .bookingTeacher.isNotEmpty)
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          if (controller
                                              .bookingTeacher.isNotEmpty)
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              width: widthScreen,
                                              margin: const EdgeInsets.only(
                                                  left: 9,
                                                  right: 9,
                                                  bottom: 14,
                                                  top: 15),
                                              padding: const EdgeInsets.only(
                                                  left: 9,
                                                  right: 9,
                                                  bottom: 14,
                                                  top: 15),
                                              child: CustomText(
                                                text: "bookings".tr,
                                                fontSize: 26,
                                                color: Colors.black,
                                              ),
                                            ),
                                          if (controller
                                              .bookingTeacher.isNotEmpty)
                                            SizedBox(
                                              width: widthScreen/2,
                                              child: GridView.builder(
                                                itemCount:
                                                controller
                                                        .bookingTeacher.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount:
                                                      MediaQuery.of(context)
                                                                  .size
                                                                  .shortestSide <
                                                              600
                                                          ? 2
                                                          : 3,
                                                  childAspectRatio: (0.8),
                                                ),
                                                itemBuilder: (_, index) => Obx(
                                                  () => InkWell(
                                                    child: CustomCardMonthExam(
                                                      image:
                                                          "https://edu-lens.com/images/courses/${controller.coursesTeacher[index].image}",
                                                      title:
                                                      controller
                                                              .bookingTeacher[
                                                                  index]
                                                              .name,
                                                      free: homeController
                                                          .studentReservations
                                                          .any((element) =>
                                                              element.id ==
                                                                  controller
                                                                  .bookingTeacher[
                                                                      index]
                                                                  .id),
                                                      cost:
                                                      controller
                                                              .bookingTeacher[
                                                                  index]
                                                              .cost
                                                              .toString(),
                                                    ),
                                                    onTap: () {
                                                      debugPrint(
                                                          controller
                                                              .bookingTeacher[
                                                                  index]
                                                              .toJson()
                                                              .toString());
                                                      if (homeController
                                                          .solvedExams
                                                          .any((element) =>
                                                              element.id ==
                                                                  controller
                                                                  .monthExamTeacher[
                                                                      index]
                                                                  .id)) {
                                                        showCustomSnackBar(
                                                            context: context,
                                                            title: "note".tr,
                                                            deck:
                                                                "تم الحجز بنجاح",
                                                            contentType:
                                                                ContentType
                                                                    .warning);
                                                      } else {
                                                        BottomSheetPey
                                                            .bottomSheetReserveCourse(
                                                          bookingModel:
                                                          controller
                                                                      .bookingTeacher[
                                                                  index],
                                                          context: context,
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                                padding: const EdgeInsets.all(10),
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                              ),
                                            ),
                                        ],
                                      )),
                                const SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                )));
  }
}
