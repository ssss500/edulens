import 'dart:convert';
import 'dart:developer';
import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/model/teacher_model.dart';
import 'package:edu_lens/view/widget/custom_image_url_view.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CardImageTeacher extends GetView<HomeController> {
  CardImageTeacher(
      {super.key,
      this.height,
      this.width,
      this.love = true,
      this.name = false,
      required this.dateTeacher});

  final double? height;

  final double? width;
  TeacherModel dateTeacher;

  final bool? love;
  final bool? name;
 // HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Stack(
          children: [
            CustomImageUrlViewNotZoom(
              image:
                  "https://edu-lens.com/images/teachers/${dateTeacher.image}",
              fit: BoxFit.fitHeight,
              height: height,
            ),
            if (love == true)
              Obx(
                () => Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black12),
                      child: InkWell(
                          onTap: () async {
                            List mapTeacherLoves = [];
                            HomeController homeController =
                                Get.put(HomeController());
                            // debugPrint("listTeacherLoves : ${GetStorage().read("listTeacherLoves")}");
                            if (GetStorage().read("listTeacherLoves") == '') {
                              log('add');
                              mapTeacherLoves.add(dateTeacher);
                            } else {
                              var jsonData = jsonDecode(
                                  GetStorage().read("listTeacherLoves"));

                              mapTeacherLoves = List<TeacherModel>.from(jsonData
                                      .map((i) => TeacherModel.fromJson(i)))
                                  .toList()
                                  .obs;
                              debugPrint(
                                  "mapTeacherLoves remove : $mapTeacherLoves");

                              if (homeController.idListTeacherLove
                                  .contains(dateTeacher.id)) {
                                log('remove');
                                mapTeacherLoves.removeAt(homeController
                                    .idListTeacherLove
                                    .indexOf(dateTeacher.id));
                              } else {
                                log('add');
                                mapTeacherLoves.add(dateTeacher);
                              }
                            }

                            log("mapTeacherLoves: $mapTeacherLoves");

                            String jsonString = jsonEncode(mapTeacherLoves);

                            await GetStorage()
                                .write("listTeacherLoves", jsonString);
                            homeController.idListTeacherLove.value =
                                await homeController.getIdTeacherLoveFun();
                            homeController.idListTeacherLove.refresh();
                          },
                          child: controller.idListTeacherLove
                                  .contains(dateTeacher.id)
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border)),
                    ),
                  ),
                ),
              ),
            name != true
                ? const SizedBox()
                : Align(
                    alignment: Alignment.bottomCenter,
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
                              "${dateTeacher.firstName} ${dateTeacher.lastName}",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
