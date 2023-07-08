import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:edu_lens/view/custom_grid_view.dart';
import 'package:edu_lens/view/widget/custom_background.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/profile_teacher_controller.dart';
import '../../../controllers/subject_teacher_controller.dart';
import '../../../helper/app_constants.dart';
import '../../../routes/routes_names.dart';
import '../../widget/card_image_teacher.dart';
import '../../widget/custom_app_bar.dart';

class SubjectTeacherScreen extends GetView<SubjectTeacherController> {
  const SubjectTeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        controller.cleanData();
        Get.back();
        // homeCoursesController.controller.changeVideo(playVideoFrom: playVideoFrom);
        return Future.value(false);
      },
      child: CustomBackground(
        child: ConnectivityWidget(
          onlineCallback: () {
            controller.getSubjectTeacherMethod();
          },
          builder: (context, isOnline) =>
              Obx(() =>  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: IconButton(
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                              text: controller.titleSubjectTeacher,
                              color: AppConstants.lightPrimaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            controller.subjectTeachers.isEmpty
                                ?  SizedBox(
                              height: MediaQuery.sizeOf(context).height / 1.2,
                              width: MediaQuery.sizeOf(context).width / 1.3,
                              child:  Center(
                                child: CustomText(
                                  text: "لا يوجد أي مدرسين حتي الأن",
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),)

                                :  Center(
                              child: SizedBox(
                                height: MediaQuery.sizeOf(context).height / 1.2,
                                width: MediaQuery.sizeOf(context).width / 1.3,
                                child: CustomGridView(
                                  itemCount: controller.subjectTeachers.length,
                                  crossAxisCount: 4,
                                  itemBuilder: (_, index) => InkWell(
                                    child: Container(
                                      margin: const EdgeInsets.all(20),
                                      child: Hero(
                                          tag: "imageTeacher$index",
                                          child: CardImageTeacher(
                                            dateTeacher: controller
                                                .subjectTeachers[index],
                                            name: true,
                                            // image:
                                            //     "https://edu-lens.com/images/teachers/${subjectController.subjectTeachers[index].image}",
                                          )),
                                    ),
                                    onTap: () {
                                      ProfileTeacherController
                                          profileTeacherController =
                                          Get.put(ProfileTeacherController());

                                      profileTeacherController.dateTeacher =
                                          controller.subjectTeachers[index];
                                      profileTeacherController.index = index;
                                      profileTeacherController
                                          .getCoursesAndExamAndBookings();
                                      Get.toNamed(
                                          RoutesNames.subjectTeacher);
                                    },
                                  ),
                                  padding: 10,
                                  // physics: const NeverScrollableScrollPhysics(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width/10,
                        )
                      ],
                    )),
        ),
      ),
    );
  }
}
