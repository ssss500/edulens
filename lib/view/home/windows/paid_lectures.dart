import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home/home_controllers.dart';
import '../../../controllers/video_controller.dart';
import '../../../helper/app_constants.dart';
import '../../video/video_view.dart';
import '../../widget/custom_image_url_view.dart';
import '../../widget/custom_loading.dart';
import '../../widget/custom_text.dart';

class PaidLectureScreen extends GetView<HomeController> {
  PaidLectureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.lecturePaid.isEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(50),
                child: Image.asset(
                  'assets/images/mirage-no-comments.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: CustomText(
                  text: "لم تقم بشراء اي محاضرة حتي الان",
                  fontSize: 24,
                ),
              ),
            ],
          )
        : Column(
            children: [
              CustomText(text: 'المحاضرات التي تم شراؤها', color: AppConstants.lightPrimaryColor, fontSize: 24,fontWeight: FontWeight.bold,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 750,
                    height: 620,
                    child: GridView.builder(
                      itemCount: controller.lecturePaid.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            MediaQuery.of(context).size.shortestSide < 600
                                ? 2
                                : 3,
                        childAspectRatio: (0.8),
                      ),
                      itemBuilder: (_, index) => InkWell(
                        onTap: () async {
                          Get.dialog(CustomLoading());
                          VideoController videoController =
                              Get.put(VideoController());
                          await videoController.openVideo(
                              lecturePaidModel:
                              controller.lecturePaid[index]);
                          videoController.getVideoExtensionsPayed(
                              lecturePaidModel:
                              controller.lecturePaid[index]);
                          Get.back();
                          // Get.to(() => VideoView(
                          //       title: homeController.lecturePaid[index].name
                          //           .toString(),
                          //     ));
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
                                      "https://edu-lens.com/images/courses/lectures/${controller.lecturePaid[index].image}",
                                  fit: BoxFit.cover,
                                  height: double.infinity,
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
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
                                            "${controller.lecturePaid[index].name}",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
