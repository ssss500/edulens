import 'dart:convert';

import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/controllers/home_courses_controller.dart';
import 'package:edu_lens/controllers/profile_teacher_controller.dart';
import 'package:edu_lens/model/teacher_model.dart';
import 'package:edu_lens/view/profile_teacher_view.dart';
import 'package:edu_lens/view/widget/card_image_teacher.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// ignore: must_be_immutable
// List<TeacherModel> listTeacherLoves=teachersLove;

class FavouriteMobile extends StatefulWidget {
  @override
  State<FavouriteMobile> createState() => _FavouriteMobileState();
}

class _FavouriteMobileState extends State<FavouriteMobile> {
  // HomeController homeController = Get.put(HomeController());
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
                child: CustomText(text:"عند الضغط علي زر الاعجاب علي اي مدرس سوف يظهر هنا"
                ,fontSize: 24,),
              ),
            ],
          )
        : GridView.builder(
            itemCount: teachersLove.length,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.shortestSide < 600
                  ? 2
                  : 3,
              childAspectRatio: (0.8),
            ),
            itemBuilder: (_, index) => InkWell(
              child: Hero(
                  tag: "imageTeacher$index",
                  child: CardImageTeacher(
                    name: true,
                    dateTeacher: teachersLove[index],
                    // image:
                    //     "https://edu-lens.com/images/teachers/${teachersLove[index].image}",
                  )),
              onTap: () {
                ProfileTeacherController profileTeacherController =
                    Get.put(ProfileTeacherController());
                profileTeacherController.dateTeacher = teachersLove[index];
                profileTeacherController.index = index;
                profileTeacherController.getCoursesAndExamAndBookings();

                Get.to(() => ProfileTeacherView());
              },
            ),
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
          );
  }
}
