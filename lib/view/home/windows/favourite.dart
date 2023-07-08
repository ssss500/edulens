import 'dart:convert';

import 'package:edu_lens/view/custom_grid_view.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../controllers/profile_teacher_controller.dart';
import '../../../helper/app_constants.dart';
import '../../../model/teacher_model.dart';
import '../../../routes/routes_names.dart';
import '../../widget/card_image_teacher.dart';

class FavouriteWindows extends StatefulWidget {
  const FavouriteWindows({Key? key}) : super(key: key);

  @override
  State<FavouriteWindows> createState() => _FavouriteWindowsState();
}

class _FavouriteWindowsState extends State<FavouriteWindows> {
  List<TeacherModel> teachersLove = [];

  getTeachersLove() {
    try {
      dynamic jsonData = jsonDecode(GetStorage().read("listTeacherLoves"));
      teachersLove = List<TeacherModel>.from(
          jsonData.map((i) => TeacherModel.fromJson(i)));
    } catch (e) {
      teachersLove = [];
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getTeachersLove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return teachersLove.isEmpty
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
                  text: "عند الضغط علي زر الاعجاب علي اي مدرس سوف يظهر هنا",
                  fontSize: 24,
                ),
              ),
            ],
          )
        : Column(
            children: [
                CustomText(
                  text: 'المفضلة',
                  color: AppConstants.lightPrimaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: CustomGridView(
                    itemCount: teachersLove.length,
                    crossAxisCount: 4,
                    itemBuilder: (_, index) => InkWell(
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        child: Hero(
                            tag: "imageTeacher$index",
                            child: CardImageTeacher(
                              name: true,
                              dateTeacher: teachersLove[index],
                              // image:
                              //     "https://edu-lens.com/images/teachers/${teachersLove[index].image}",
                            )),
                      ),
                      onTap: () {
                        ProfileTeacherController profileTeacherController =
                            Get.put(ProfileTeacherController());
                        profileTeacherController.dateTeacher =
                            teachersLove[index];
                        profileTeacherController.index = index;
                        profileTeacherController.getCoursesAndExamAndBookings();

                        Get.toNamed(
                            RoutesNames.subjectTeacher);                      },
                    ),
                    padding: 10,
                    // physics: const NeverScrollableScrollPhysics(),
                  ),
                ),

                CustomText(
                  text: "اضغط علي زر المفضلة لاضافة المزيد من المدرسين هنا",
                  fontSize: 24,
                ),
              ]);
  }
}
