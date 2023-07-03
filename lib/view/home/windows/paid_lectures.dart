import 'package:edu_lens/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home/home_controllers.dart';
import '../../../controllers/video_controller.dart';
import '../../../helper/app_constants.dart';
import '../../../routes/routes_names.dart';
import '../../widget/custom_image_url_view.dart';
import '../../widget/custom_loading.dart';
import '../../widget/custom_text.dart';

class PaidLectureScreen extends GetView<HomeController> {
  const PaidLectureScreen({Key? key}) : super(key: key);

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
              CustomText(
                text: 'المحاضرات التي تم شراؤها',
                color: AppConstants.lightPrimaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomGridView(
                    itemCount: controller.lecturePaid.length,
                    crossAxisCount: 3,
                    itemBuilder: (_, index) => InkWell(
                      onTap: () async {
                        Get.dialog(const CustomLoading());
                        VideoController videoController =
                            Get.put(VideoController());
                        await videoController.openVideo(
                            lecturePaidModel: controller.lecturePaid[index]);
                        videoController.getVideoExtensionsPayed(
                            lecturePaidModel: controller.lecturePaid[index]);
                        Get.back();
                        Get.toNamed(RoutesNames.videoView, arguments: {
                          'title':
                              controller.lecturePaid[index].name.toString(),
                        });
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
                                fit: BoxFit.fill,
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
                          ),),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
