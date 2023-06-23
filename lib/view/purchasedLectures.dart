import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/controllers/video_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/model/lecture_paid_model.dart';
import 'package:edu_lens/routes/routes_names.dart';
import 'package:edu_lens/view/video/video_view.dart';
import 'package:edu_lens/view/widget/custom_app_bar.dart';
import 'package:edu_lens/view/widget/custom_image_url_view.dart';
import 'package:edu_lens/view/widget/custom_list_view.dart';
import 'package:edu_lens/view/widget/custom_loading.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchasedLectures extends StatelessWidget {
  PurchasedLectures({Key? key}) : super(key: key);
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        title: "purchasedLectures".tr,
        widget: homeController.lecturePaid.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 20),
                    child: Image.asset(
                      'assets/images/mirage-no-comments.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomText(
                      text: "لم تقم بشراء اي محاضرة حتي الان",
                      fontSize: 24,
                    ),
                  ),
                ],
              )
            : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: homeController.lecturePaid.length,
                  gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.shortestSide < 600
                        ? 2
                        : 3,
                    childAspectRatio: (0.8),
                  ),
                  itemBuilder: (_, index) => InkWell(
                    onTap: () async {
                      Get.dialog(CustomLoading());

                      VideoController videoController =
                      Get.put(VideoController());
                      await videoController.openVideo(lecturePaidModel:homeController.lecturePaid[index]);
                      videoController.getVideoExtensionsPayed(lecturePaidModel:homeController.lecturePaid[index]);
                      Get.back();
                      Get.toNamed(RoutesNames.videoView, arguments: {'title': homeController.lecturePaid[index].name.toString()});
                    },
                    child: Container(
                        margin: const EdgeInsets.only(
                            left: 9, right: 9, bottom: 10, top: 5),
                        decoration: BoxDecoration(
                          color: AppConstants.primaryColor,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Stack(
                          children: [
                            CustomImageUrlViewNotZoom(
                              image:
                                  "https://edu-lens.com/images/courses/lectures/${homeController.lecturePaid[index].image}",
                              fit: BoxFit.cover,
                              height: double.infinity,
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,right: 0,
                              child: Material(
                                color: Colors.transparent,
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  padding: const EdgeInsets.only(
                                      left: 6, right: 6, bottom: 3, top: 3),
                                  child: CustomText(
                                    text:
                                        "${homeController.lecturePaid[index].name}",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
            ));
  }
}
