import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/model/teacher_model.dart';
import 'package:edu_lens/services/get_subject_teacher_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectTeacherController extends GetxController {
  int subjectId = 0,indexSubject=0;
  String titleSubjectTeacher = '';
  var subjectTeachers = <TeacherModel>[].obs;
  final services = GetSubjectTeacherServices();

  getSubjectTeacherMethod() async {
    HomeController homeController = Get.put(HomeController());
    subjectId = homeController.subject[indexSubject].id!;
    titleSubjectTeacher = homeController.subject[indexSubject].name!;
    subjectTeachers.value = (await services.getSubjectTeacher())!;
  }
  cleanData(){
    subjectTeachers.value=[];
    titleSubjectTeacher='';
    subjectId=0;
  }
}
