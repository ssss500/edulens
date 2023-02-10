import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppConstants {
  static const Color primaryColor = Color(0xFF54BBD2);
  static const Color lightPrimaryColor = Color(0xFFffc467);
  static const String baseUrl = "https://edu-lens.com/api/";
  static const String teachers = "class-teachers";
  static const String subject = "class-subjects";
  static const String subjectTeacher = "subject-teachers";
  static const String classPlan = "class-plan";
  static const String login = "login";
  static const String register = "register";
  static const String city = "cities";
  static const String sections = "sections";
  static const String genders = "genders";
  static const String classes = "classes";
  static const String token = "token";
  static const String studentId = "id";
  static const String studentClassId = "classId";
  static const String studentsData = "customstudent";
  static const String customCourses = "customcourses";
  static const String customBooking = "customreservations";
  static const String customMonthExam = "custommonthexam";
  static const String customChapters = "customchapters";
  static const String customLectures = "customlectures";
  static const String lectureBooks = "lecturebooks";
  static const String lectureExams = "lectureexams";
  static const String customExamQuestion = "customexamquestion";
  static const String studentExams = "student-exams";
  static const String startExam = "start-exam";
  static const String endExam = "end-exam";
  static const String appVersion = "appversion";
  static const String studentLecture = "student-lecs";
  static const String studentChapter = "student-chapters";
  static const String covers = "covers";
  static const String message = "messages";
  static const String activateCouponChapter = "activate-coupon-chapter";
  static const String buyThisLecture = "buythislecture";
  static const String buyThisChapter = "buythischapter";
  static const String buyExamByBucket = "buyexambybucket";
  static const String reserveCourse = "reserve-course";
  static const String studentReservations = "student-reservations";
  static const String activateCouponLecture = "activate-coupon-lecture";
  static const List<String> listYearString = [
    'الصف الأول الثانوي',
    'الصف الثاني الثانوي',
    'الصف الثالث الثانوي'
  ];
  static List listTitles = [
    'homeTitle'.tr,
    // 'questionBank'.tr,
    'favourites'.tr,
    'profile'.tr,
  ];
  static List<TabItem> itemsBottomBar = [
    const TabItem(
      icon: Icons.home,
    ),
    // const TabItem(
    //   icon: Icons.menu_book_outlined,
    // ),
    const TabItem(
      icon: Icons.favorite,
    ),

    const TabItem(
      icon: Icons.person,
    ),
  ];
}
