import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/model/courses_models/chapter_model.dart';
import 'package:edu_lens/model/plan_model.dart';
import 'package:edu_lens/model/profile_teacher_models/courses_model.dart';
import 'package:edu_lens/model/teacher_model.dart';
import 'package:edu_lens/services/get_plans_services.dart';
import 'package:edu_lens/services/get_subject_teacher_services.dart';
import 'package:edu_lens/view/widget/custom_buttom.dart';
import 'package:edu_lens/view/widget/custom_dialog/snackBar.dart';
import 'package:edu_lens/view/widget/custom_list_view.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/home_controllers.dart';

class PackageController extends GetxController {
  final services = GetPlansServices();
  final plansList = <PlanModel>[].obs;
  var subjectTeachers = <TeacherModel>[].obs;
  var chapters = <ChapterModel>[].obs;
  final coursesTeacher = <CoursesModel>[].obs;
  final checkList=[].obs;
  late PlanModel selectedPackage;
  RxInt subjectId = 1.obs, chapterId = 0.obs;
  int indexSubject = 0;
  HomeController homeController = Get.put(HomeController());

  @override
  void onInit() async {
    super.onInit();
    subjectId.value = homeController.subject[indexSubject].id!;
  }

  getChapters(idTeacher) async {
    coursesTeacher.clear();
    chapters.clear();
    coursesTeacher.value = (await services.getTeacherCourses(id: idTeacher))!;
    chapters.value = (await services.getChapter(
        id: coursesTeacher.first.pivot!['course_id']))!;
    // lectures.value = (await services.getLectures())!;
  }

  getPackages() async {
    subjectId.value = homeController.subject.first.id!.toInt();
    indexSubject = 0;
    plansList.value = (await services.getPlans())!;
    await getSubjectTeacherMethod();
  }

  getSubjectTeacherMethod() async {
    subjectId.value = homeController.subject[indexSubject].id!;

    subjectTeachers.value = (await services.getSubjectTeacher())!;
  }

  void bottomSheetSelectCourse({
    required BuildContext context,
  }) {
    final widthScreen = MediaQuery.of(context).size.width;
    HomeController homeController = Get.put(HomeController());
    Get.bottomSheet(
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child:Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Obx(
              () => chapters.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppConstants.lightPrimaryColor,
                    ))
                  : CustomListView(
                      padding: 0,
                      scroll: true,
                      itemCount: chapters.length,
                      itemBuilder: (BuildContext context, int indexChapters) {
                        return Container(
                          decoration: BoxDecoration(
                            color: AppConstants.primaryColor,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: widthScreen * 0.65,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 40,
                                              child: CustomText(
                                                text:
                                                    chapters[indexChapters].name!,
                                                color: Colors.white,
                                                textAlign: TextAlign.start,
                                                alignment: Alignment.centerRight,
                                                fontSize: 25,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                              child: CustomText(
                                                text:
                                                    "عدد المحاضرات  : ${chapters[indexChapters].lectures!.length}",
                                                color: Colors.white,
                                                textAlign: TextAlign.start,
                                                alignment: Alignment.centerRight,
                                                fontSize: 17,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (!homeController.chapterPaid.any(
                                          (element) =>
                                              element.id ==
                                              chapters[indexChapters].id))
                                        Checkbox(
                                          value: checkList.contains(chapters[indexChapters].id),
                                          onChanged: (c) {

                                            if(checkList.contains(chapters[indexChapters].id)){
                                              checkList.remove(chapters[indexChapters].id);
                                            }else{
                                              if(checkList.length<selectedPackage.chapterNumber){
                                              checkList.add(chapters[indexChapters].id);
                                              }else{
                                                showCustomSnackBar(
                                                    context: context,
                                                    title: "note".tr,
                                                    deck: "تم بلوغ الحد الاقصي من الفصول",
                                                    contentType: ContentType.failure);
                                              }
                                            }
                                          },
                                          activeColor:
                                              AppConstants.lightPrimaryColor,
                                        )
                                      else if (!homeController
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
                            ],
                          ),
                        );
                      }),
            ),
          ),
        ),
      ),
      enableDrag: true,
      backgroundColor: Colors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
    );
  }

  void puyChapter() {
    services.puyChapter();
  }
}
