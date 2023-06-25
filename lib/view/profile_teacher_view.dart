import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/controllers/home_courses_controller.dart';
import 'package:edu_lens/controllers/profile_teacher_controller.dart';
import 'package:edu_lens/controllers/quiz/question_month_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/model/courses_models/solved_exams_model.dart';
import 'package:edu_lens/view/buttom_sheet_paid.dart';
import 'package:edu_lens/view/home_courses_view.dart';
import 'package:edu_lens/view/quiz/question_month_view.dart';
import 'package:edu_lens/view/video/video_view.dart';
import 'package:edu_lens/view/widget/CustomCardMonthExam.dart';
import 'package:edu_lens/view/widget/card_image_teacher.dart';
import 'package:edu_lens/view/widget/custom_app_bar.dart';
import 'package:edu_lens/view/widget/custom_buttom.dart';
import 'package:edu_lens/view/widget/custom_card_curses.dart';
import 'package:edu_lens/view/widget/custom_image_url_view.dart';
import 'package:edu_lens/view/widget/custom_list_view.dart';
import 'package:edu_lens/view/widget/custom_loading.dart';
import 'package:edu_lens/view/widget/custom_social_media_icons.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edu_lens/view/widget/custom_dialog/snackBar.dart';

class ProfileTeacherView extends GetView {
 const   ProfileTeacherView({super.key});


  @override
  Widget build(BuildContext context) {

    ProfileTeacherController profileTeacherController =
    Get.find();
    final QuestionMonthController questionMonthController =
    Get.find();
    HomeController homeController = Get.find();
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppConstants.primaryColor,
      body: WillPopScope(
        onWillPop: () {
          profileTeacherController.cleanData();
          Get.back();
          return Future.value(false);
        },
        child: ConnectivityWidget(
          onlineCallback: () {
            profileTeacherController.getCoursesAndExamAndBookings();
          },
          builder: (context, isOnline) => SafeArea(
            bottom: false,
            child: SizedBox(
              height: heightScreen,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: IconButton(
                              onPressed: () {
                                profileTeacherController.cleanData();

                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        width: widthScreen,
                        height: heightScreen * 0.21,
                        margin: const EdgeInsets.only(left: 9, right: 9),
                        child: Row(
                          children: [
                            Hero(
                              tag:
                                  "imageTeacher${profileTeacherController.index}",
                              child: CardImageTeacher(
                                dateTeacher:
                                    profileTeacherController.dateTeacher,
                                width: widthScreen * 0.34,
                              ),
                            ),
                            Container(
                              height: heightScreen * 0.20,
                              width: widthScreen * 0.55,
                              padding: const EdgeInsets.only(
                                  top: 10, right: 3, left: 5),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text:
                                          "${profileTeacherController.dateTeacher.firstName!} ${profileTeacherController.dateTeacher.lastName!}",
                                      fontSize: 23,
                                      heightContainer: heightScreen * 0.20 / 5,
                                      widthContainer: widthScreen * 0.55,
                                      alignment: Alignment.centerRight,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    CustomText(
                                        text:
                                            "نبذة : ${profileTeacherController.dateTeacher.description} ",
                                        fontSize: 18,
                                        alignment: Alignment.centerRight,
                                        color: Colors.white,
                                        heightContainer:
                                            (heightScreen * 0.20) / 5,
                                        widthContainer: widthScreen * 0.55,
                                        textAlign: TextAlign.start),
                                    SizedBox(
                                      height: (heightScreen * 0.20) * 0.15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        if (profileTeacherController
                                                    .dateTeacher.phone !=
                                                null ||
                                            profileTeacherController
                                                    .dateTeacher.phone !=
                                                "")
                                          Expanded(
                                            child: SocialButton(
                                              function: () async {
                                                if (!await launchUrl(Uri.parse(
                                                    "whatsapp://send?phone=+02${profileTeacherController.dateTeacher.phone}"))) {
                                                  throw 'Could not launch ';
                                                }
                                              },
                                              image: Image.asset(
                                                  "assets/images/whatsapp.png"),
                                            ),
                                          ),
                                        if (profileTeacherController
                                                    .dateTeacher.faceLink !=
                                                null ||
                                            profileTeacherController
                                                    .dateTeacher.faceLink !=
                                                "")
                                          Expanded(
                                            child: SocialButton(
                                              function: () async {
                                                if (!await launchUrl(Uri.parse(
                                                    profileTeacherController
                                                        .dateTeacher
                                                        .faceLink!))) {
                                                  throw 'Could not launch ';
                                                }
                                              },
                                              image: Image.asset(
                                                  "assets/images/facebook.png"),
                                            ),
                                          ),
                                        if (profileTeacherController
                                                    .dateTeacher.youtubeLink !=
                                                null ||
                                            profileTeacherController
                                                    .dateTeacher.youtubeLink !=
                                                "")
                                          Expanded(
                                            child: SocialButton(
                                              function: () async {
                                                if (!await launchUrl(Uri.parse(
                                                    profileTeacherController
                                                        .dateTeacher
                                                        .youtubeLink!))) {
                                                  throw 'Could not launch ';
                                                }
                                              },
                                              image: Image.asset(
                                                  "assets/images/youtube.png"),
                                            ),
                                          ),
                                        if (profileTeacherController
                                                    .dateTeacher.instaLink !=
                                                null ||
                                            profileTeacherController
                                                    .dateTeacher.instaLink !=
                                                "")
                                          Expanded(
                                            child: SocialButton(
                                              function: () async {
                                                if (!await launchUrl(Uri.parse(
                                                    profileTeacherController
                                                        .dateTeacher
                                                        .instaLink!))) {
                                                  throw 'Could not launch ';
                                                }
                                              },
                                              image: Image.asset(
                                                  "assets/images/instagram.png"),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: heightScreen * 0.293,
                    child: Container(
                        height: heightScreen * 0.70,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/backgroundHome.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 20,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              topRight: Radius.elliptical(40, 40),
                              topLeft: Radius.elliptical(40, 40)),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Obx(() => profileTeacherController
                                      .coursesTeacher.isEmpty
                                  ? !profileTeacherController
                                          .loadingCoursesTeacher.value
                                      ? SizedBox(
                                          child: Center(
                                              child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black38,
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
                                                text: "courses".tr,
                                                fontSize: 26,
                                                color: AppConstants
                                                    .lightPrimaryColor,
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
                                              child: CircularProgressIndicator(
                                            color:
                                                AppConstants.lightPrimaryColor,
                                          )))
                                  : Column(
                                      children: [
                                        if (profileTeacherController
                                            .coursesTeacher.isNotEmpty)
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        if (profileTeacherController
                                            .coursesTeacher.isNotEmpty)
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black38,
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
                                              text: "courses".tr,
                                              fontSize: 26,
                                              color: AppConstants
                                                  .lightPrimaryColor,
                                            ),
                                          ),
                                        if (profileTeacherController
                                            .coursesTeacher.isNotEmpty)
                                          GridView.builder(
                                            itemCount: profileTeacherController
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
                                            itemBuilder: (_, index) => InkWell(
                                              onTap: () {
                                                HomeCoursesController
                                                    homeCourses = Get.put(HomeCoursesController());
                                                homeCourses.chapterId =
                                                    profileTeacherController
                                                        .coursesTeacher[index]
                                                        .pivot!['course_id'];
                                                homeCourses.getChapters();
                                                Get.toNamed('/coursesFromHome');
                                              },
                                              child: CustomCardCurses(
                                                image:
                                                    "https://edu-lens.com/images/courses/${profileTeacherController.coursesTeacher[index].image}",
                                                title: profileTeacherController
                                                    .coursesTeacher[index].name,
                                              ),
                                            ),
                                            padding: const EdgeInsets.all(10),
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                          ),
                                      ],
                                    )),
                              Obx(() => Column(
                                    children: [
                                      if (profileTeacherController
                                          .monthExamTeacher.isNotEmpty)
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      if (profileTeacherController
                                          .monthExamTeacher.isNotEmpty)
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black38,
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
                                            color:
                                                AppConstants.lightPrimaryColor,
                                          ),
                                        ),
                                      if (profileTeacherController
                                          .monthExamTeacher.isNotEmpty)
                                        GridView.builder(
                                          itemCount: profileTeacherController
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
                                                      homeController.solvedExams
                                                          .any((element) =>
                                                              element.id ==
                                                              profileTeacherController
                                                                  .monthExamTeacher[
                                                                      index]
                                                                  .id) ||
                                                      profileTeacherController
                                                              .monthExamTeacher[
                                                                  index]
                                                              .cost ==
                                                          0,
                                                  cost: profileTeacherController
                                                      .monthExamTeacher[index]
                                                      .cost
                                                      .toString(),
                                                  image:
                                                      "https://edu-lens.com/images/teachers/${profileTeacherController.dateTeacher.image}",
                                                  title:
                                                      profileTeacherController
                                                          .monthExamTeacher[
                                                              index]
                                                          .title,
                                                ),
                                              ),
                                              onTap: () async {
                                                if (homeController
                                                        .appleAndGoogleBool
                                                        .value ||
                                                   ( profileTeacherController
                                                            .monthExamTeacher[
                                                                index]
                                                            .cost ==
                                                        0&&homeController
                                                       .solvedExams
                                                       .where((v) =>
                                                   v.id ==
                                                       profileTeacherController
                                                           .monthExamTeacher[
                                                       index]
                                                           .id)
                                                       .isEmpty) ||
                                                    homeController
                                                            .studentProfile[0]
                                                            .phone ==
                                                        '01022535966') {
                                                  profileTeacherController
                                                      .goToQuiz(index);
                                                } else if (homeController
                                                    .solvedExams
                                                    .where((v) =>
                                                        v.id ==
                                                        profileTeacherController
                                                            .monthExamTeacher[
                                                                index]
                                                            .id)
                                                    .isEmpty) {
                                                  BottomSheetPey
                                                      .bottomSheetPaidForMonthExam(
                                                    dataMonthExam:
                                                        profileTeacherController
                                                                .monthExamTeacher[
                                                            index],
                                                    context: context,
                                                  );
                                                } else if (homeController
                                                        .solvedExams
                                                        .where((v) =>
                                                            v.id ==
                                                            profileTeacherController
                                                                .monthExamTeacher[
                                                                    index]
                                                                .id)
                                                        .first
                                                        .status ==
                                                    0) {
                                                  profileTeacherController
                                                      .goToQuiz(index);
                                                }else{
                                                  showCustomSnackBar(
                                                           context: context,
                                                           title: "note".tr,
                                                           deck:
                                                           "تم حل الامتحان من قبل",
                                                           contentType: ContentType
                                                               .failure);
                                                }
                                                // if (homeController
                                                //         .appleAndGoogleBool
                                                //         .value ||
                                                //     profileTeacherController
                                                //             .monthExamTeacher[
                                                //                 index]
                                                //             .cost ==
                                                //         0 ||
                                                //     homeController.solvedExams
                                                //         .any((element) =>
                                                //             element.id ==
                                                //             profileTeacherController
                                                //                 .monthExamTeacher[
                                                //                     index]
                                                //                 .id) ||
                                                //     homeController
                                                //             .studentProfile[0]
                                                //             .phone ==
                                                //         '01022535966') {
                                                //   if (homeController
                                                //               .solvedExams
                                                //               .where((v) =>
                                                //                   v.id ==
                                                //                   profileTeacherController
                                                //                       .monthExamTeacher[
                                                //                           index]
                                                //                       .id)
                                                //               .first
                                                //               .status !=
                                                //           2 &&
                                                //       homeController.solvedExams
                                                //           .any((element) =>
                                                //               element.id ==
                                                //               profileTeacherController
                                                //                   .monthExamTeacher[
                                                //                       index]
                                                //                   .id)) {
                                                //     profileTeacherController
                                                //         .goToQuiz(index);
                                                //   } else {
                                                //     showCustomSnackBar(
                                                //         context: context,
                                                //         title: "note".tr,
                                                //         deck:
                                                //         "تم حل الامتحان من قبل",
                                                //         contentType: ContentType
                                                //             .failure);
                                                //
                                                //   }
                                                // } else {
                                                //   BottomSheetPey
                                                //       .bottomSheetPaidForMonthExam(
                                                //     dataMonthExam:
                                                //         profileTeacherController
                                                //                 .monthExamTeacher[
                                                //             index],
                                                //     context: context,
                                                //   );
                                                // }
                                              },
                                            );
                                          },
                                          padding: const EdgeInsets.all(10),
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                        ),
                                    ],
                                  )),

                              ///booking
                              if (!homeController.appleAndGoogleBool.value)
                                Obx(() => Column(
                                      children: [
                                        if (profileTeacherController
                                            .bookingTeacher.isNotEmpty)
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        if (profileTeacherController
                                            .bookingTeacher.isNotEmpty)
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black38,
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
                                              color: AppConstants
                                                  .lightPrimaryColor,
                                            ),
                                          ),
                                        if (profileTeacherController
                                            .bookingTeacher.isNotEmpty)
                                          GridView.builder(
                                            itemCount: profileTeacherController
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
                                                      "https://edu-lens.com/images/courses/${profileTeacherController.coursesTeacher[index].image}",
                                                  title:
                                                      profileTeacherController
                                                          .bookingTeacher[index]
                                                          .name,
                                                  free: homeController
                                                      .studentReservations
                                                      .any((element) =>
                                                          element.id ==
                                                          profileTeacherController
                                                              .bookingTeacher[
                                                                  index]
                                                              .id),
                                                  cost: profileTeacherController
                                                      .bookingTeacher[index]
                                                      .cost
                                                      .toString(),
                                                ),
                                                onTap: () {
                                                  debugPrint(
                                                      profileTeacherController
                                                          .bookingTeacher[index]
                                                          .toJson()
                                                          .toString());
                                                  if (homeController.solvedExams
                                                      .any((element) =>
                                                          element.id ==
                                                          profileTeacherController
                                                              .monthExamTeacher[
                                                                  index]
                                                              .id)) {
                                                    showCustomSnackBar(
                                                        context: context,
                                                        title: "note".tr,
                                                        deck: "تم الحجز بنجاح",
                                                        contentType: ContentType
                                                            .warning);
                                                  } else {
                                                    BottomSheetPey
                                                        .bottomSheetReserveCourse(
                                                      bookingModel:
                                                          profileTeacherController
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
