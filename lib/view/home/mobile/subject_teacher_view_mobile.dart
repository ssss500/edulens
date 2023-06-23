import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:edu_lens/controllers/profile_teacher_controller.dart';
import 'package:edu_lens/controllers/subject_teacher_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/routes/routes_names.dart';
import 'package:edu_lens/view/profile_teacher_view.dart';
import 'package:edu_lens/view/widget/card_image_teacher.dart';
import 'package:edu_lens/view/widget/custom_app_bar.dart';
import 'package:edu_lens/view/widget/custom_refresher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectTeacher extends StatelessWidget {
  SubjectTeacher({Key? key}) : super(key: key);
  SubjectTeacherController subjectController =
      Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        subjectController.cleanData();
        Get.back();
        // homeCoursesController.controller.changeVideo(playVideoFrom: playVideoFrom);
        return Future.value(false);
      },
      child: CustomAppBar(
        functionBake: () {
          subjectController.cleanData();
          Get.back();
        },
        title: subjectController.titleSubjectTeacher,
        widget: ConnectivityWidget(
          onlineCallback: () {
            subjectController.getSubjectTeacherMethod();
          },
          builder: (context, isOnline) =>
              Obx(() => subjectController.subjectTeachers.isEmpty
                  ? const SizedBox(
                      height: 170,
                      child: Center(
                          child: CircularProgressIndicator(
                        color: AppConstants.lightPrimaryColor,
                      )))
                  : GridView.builder(
                      itemCount: subjectController.subjectTeachers.length,
                      gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.shortestSide < 600
                            ? 2
                            : 3,
                        childAspectRatio: (0.8),
                      ),
                      itemBuilder: (_, index) => InkWell(
                        child: Hero(
                            tag: "imageTeacher$index",
                            child: CardImageTeacher(
                              dateTeacher:
                                  subjectController.subjectTeachers[index],
                              name: true,
                              // image:
                              //     "https://edu-lens.com/images/teachers/${subjectController.subjectTeachers[index].image}",
                            )),
                        onTap: () {
                          ProfileTeacherController profileTeacherController =
                              Get.put(ProfileTeacherController());

                          profileTeacherController.dateTeacher =
                              subjectController.subjectTeachers[index];
                          profileTeacherController.index = index;
                          profileTeacherController
                              .getCoursesAndExamAndBookings();
                          Get.toNamed(RoutesNames.profileTeacherView);
                        },
                      ),
                      padding: const EdgeInsets.all(10),
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                    )),
        ),
      ),
    );
  }
}
