import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/controllers/profile_teacher_controller.dart';
import 'package:edu_lens/controllers/subject_teacher_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/cashe_helper.dart';
import 'package:edu_lens/model/teacher_model.dart';
import 'package:edu_lens/view/home/custom_video_player_for_ads_covers.dart';
import 'package:edu_lens/view/profile_teacher_view.dart';
import 'package:edu_lens/view/subject_teacher_view.dart';
import 'package:edu_lens/view/widget/card_image_teacher.dart';
import 'package:edu_lens/view/widget/custom_buttom.dart';
import 'package:edu_lens/view/widget/custom_dialog.dart';
import 'package:edu_lens/view/widget/custom_image_url_view.dart';
import 'package:edu_lens/view/widget/custom_list_view.dart';
import 'package:edu_lens/view/widget/custom_refresher.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:video_player/video_player.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    return ConnectivityWidget(
      onlineCallback: () {
        homeController.refresherMethod();
      },
      builder: (context, isOnline) => SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            //ads
            Obx(
              () => Column(
                children: [
                  homeController.covers.isEmpty
                      ? const SizedBox()
                      :
                  CarouselSlider.builder(
                          itemCount: homeController.covers.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              Container(
                            // padding: const EdgeInsets.all(50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.grey.shade300,
                            ),
                            child:homeController.covers[itemIndex].image
                                .toString()
                                .substring(homeController.covers[itemIndex].image
                                .toString()
                                .length -
                                3)
                                .toLowerCase()=="mp4"?
                            VideoPlay(pathh:"https://edu-lens.com/images/covers/${homeController.covers[itemIndex].image.toString()}")
                                : CustomImageUrlView(
                              image:
                                  "https://edu-lens.com/images/covers/${homeController.covers[itemIndex].image}",
                            ),
                          ),
                          options: CarouselOptions(
                            autoPlay:kDebugMode?false: true,
                            enlargeCenterPage: true,
                            viewportFraction: 0.5,
                            aspectRatio: 2.0,
                            initialPage: 2,
                          ),
                        ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            ///subject
            Obx(
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
                                final SubjectTeacherController
                                    subjectController =
                                    Get.put(SubjectTeacherController());
                                subjectController.indexSubject = index;
                                subjectController.getSubjectTeacherMethod();
                                Get.to(() => SubjectTeacher());
                              },
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://edu-lens.com/images/subjects/${homeController.subject[index].image!}",
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  margin:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  width: 130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) => const SizedBox(
                                  width: 130,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: AppConstants.lightPrimaryColor,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.broken_image_rounded),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    CustomText(
                                      text: "imageErrorMessage".tr,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
            ),
            Obx(() => homeController.teachers.isEmpty
                ? const SizedBox(
                    height: 170,
                    child: Center(
                        child: CircularProgressIndicator(
                      color: AppConstants.lightPrimaryColor,
                    )))
                : GridView.builder(
                    itemCount: homeController.teachers.length > 8
                        ? MediaQuery.of(context).size.shortestSide < 600
                            ? 8
                            : 9
                        : homeController.teachers.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          MediaQuery.of(context).size.shortestSide < 600
                              ? 2
                              : 3,
                      childAspectRatio: (0.8),
                    ),
                    itemBuilder: (_, index) => InkWell(
                      child: Hero(
                          tag: "imageTeacher$index",
                          child: CardImageTeacher(
                            name: true,
                            dateTeacher: homeController.teachers[index],
                            // image:
                            //     "https://edu-lens.com/images/teachers/${homeController.teachers[index].image}",
                          )),
                      onTap: () {
                        ProfileTeacherController profileTeacherController =
                            Get.put(ProfileTeacherController());

                        profileTeacherController.dateTeacher =
                            homeController.teachers[index];

                        profileTeacherController.index = index;
                        profileTeacherController.getCoursesAndExamAndBookings();

                        Get.to(() => ProfileTeacherView());
                      },
                    ),
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  )),
          ],
        ),
      ),
    )
        // )
        ;
  }
}
