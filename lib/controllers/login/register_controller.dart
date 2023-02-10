import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:edu_lens/model/city_model.dart';
import 'package:edu_lens/model/classes_model.dart';
import 'package:edu_lens/model/gender_model.dart';
import 'package:edu_lens/model/section_model.dart';
import 'package:edu_lens/model/register_model.dart';
import 'package:edu_lens/services/register_services.dart';
import 'package:edu_lens/view/widget/custom_dialog/snackBar.dart';
import 'package:edu_lens/view/widget/custom_loading.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  final services = RegisterServices();
  final firstName = "".obs;
  final lastName = "".obs;
  final email = "".obs;
  final phone = "".obs;
  final password = "".obs;
  final password2 = "".obs;
  final university = "".obs;
  final faculty = "".obs;
  final cityId = 0.obs;
  final gradeId = "1".obs;
  final studentClassId = 0.obs;
  final studentSectionId = 0.obs;
  final genderId = 0.obs;
  final department = "".obs;
  final school = "".obs;
  final parentName = "".obs;
  final parentPhone = "".obs;
  final birthday = "".obs;
  final loading = false.obs;
  final cityList = <CityModel>[].obs;
  final city = <String>[].obs;
  final citiesId = <String, int>{}.obs;
  final sectionsList = <SectionModel>[].obs;
  final sections = <String>[].obs;
  final sectionsId = <String, num>{}.obs;
  final genderList = <GenderModel>[].obs;
  final genders = <String>[].obs;
  final gendersId = <String, num>{}.obs;
  final classesList = <ClassesModel>[].obs;
  final classes = <String>[].obs;
  final classesId = <String, num>{}.obs;
  final listYearString = ['تعليم حر', 'تعليم جامعى', 'تعليم مدرسى'];
  final sectionName = "division".tr.obs;
  final classesName = "chooseYear".tr.obs;
  final genderName = "${"nationality".tr} ${Platform.isIOS ? "*" : ""}".obs;
  final year = "المرحله الدراسيه".obs;
  final cityName = "${"governorate".tr} ${Platform.isIOS ? "*" : ""}".obs;
  final check = false.obs;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  late Rx<DateTime> newDateTime = DateTime.parse('2012-01-01').obs;

  // ignore: prefer_typing_uninitialized_variables
  var token, idDevice;
  GlobalKey<FormState> formStateOne = GlobalKey<FormState>();
  GlobalKey<FormState> formStateUniversity = GlobalKey<FormState>();
  GlobalKey<FormState> formStateTow = GlobalKey<FormState>();

  @override
  Future<void> onInit() async {
    super.onInit();
    classesList.value = [
      ClassesModel(
          id: 1,
          name: "تعليم حر",
          gradeId: 1,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 2,
          name: "الفرقة الأولى",
          gradeId: 2,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 3,
          name: "الفرقة الثانية",
          gradeId: 2,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 4,
          name: "الفرقة الثالثة",
          gradeId: 2,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 5,
          name: "الفرقة الرابعة",
          gradeId: 2,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 6,
          name: "الفرقة الخامسة",
          gradeId: 2,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 7,
          name: "الفرقة السادسة",
          gradeId: 2,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 8,
          name: "الفرقة السابعة",
          gradeId: 2,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 9,
          name: "الصف الأول الإعدادي",
          gradeId: 3,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 10,
          name: "الصف الثاني الإعدادي",
          gradeId: 3,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 11,
          name: "الصف الثالث الإعدادي",
          gradeId: 3,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 12,
          name: "الصف الأول الثانوي",
          gradeId: 3,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 13,
          name: "الصف الثاني الثانوي",
          gradeId: 3,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      ClassesModel(
          id: 14,
          name: "الصف الثالث الثانوي",
          gradeId: 3,
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z")
    ];
    cityList.value = [
      CityModel(
          id: 1,
          name: "القاهرة",
          createdAt: "2022-04-14T23:00:21.000000Z",
          updatedAt: "2022-04-14T23:00:21.000000Z"),
      CityModel(
          id: 2,
          name: "الجيزة",
          createdAt: "2022-04-14T23:00:21.000000Z",
          updatedAt: "2022-04-14T23:00:21.000000Z"),
      CityModel(
          id: 3,
          name: "الأسكندرية",
          createdAt: "2022-04-14T23:00:21.000000Z",
          updatedAt: "2022-04-14T23:00:21.000000Z"),
      CityModel(
          id: 4,
          name: "الدقهلية",
          createdAt: "2022-04-14T23:00:21.000000Z",
          updatedAt: "2022-04-14T23:00:21.000000Z"),
      CityModel(
          id: 5,
          name: "الشرقية",
          createdAt: "2022-04-14T23:00:21.000000Z",
          updatedAt: "2022-04-14T23:00:21.000000Z"),
      CityModel(
          id: 6,
          name: "المنوفية",
          createdAt: "2022-04-14T23:00:21.000000Z",
          updatedAt: "2022-04-14T23:00:21.000000Z"),
      CityModel(
          id: 7,
          name: "القليوبية",
          createdAt: "2022-04-14T23:00:21.000000Z",
          updatedAt: "2022-04-14T23:00:21.000000Z"),
      CityModel(
          id: 8,
          name: "البحيرة",
          createdAt: "2022-04-14T23:00:21.000000Z",
          updatedAt: "2022-04-14T23:00:21.000000Z"),
      CityModel(
          id: 9,
          name: "الغربية",
          createdAt: "2022-04-14T23:00:21.000000Z",
          updatedAt: "2022-04-14T23:00:21.000000Z"),
      CityModel(
          id: 10,
          name: "بور سعيد",
          createdAt: "2022-04-14T23:00:21.000000Z",
          updatedAt: "2022-04-14T23:00:21.000000Z"),
      CityModel(
          id: 11,
          name: "دمياط",
          createdAt: "2022-04-14T23:00:21.000000Z",
          updatedAt: "2022-04-14T23:00:21.000000Z"),
      CityModel(
          id: 12,
          name: "الإسماعلية",
          createdAt: "2022-04-14T23:00:21.000000Z",
          updatedAt: "2022-04-14T23:00:21.000000Z"),
      CityModel(
          id: 13,
          name: "السويس",
          createdAt: "2022-04-14T23:00:21.000000Z",
          updatedAt: "2022-04-14T23:00:21.000000Z"),
      CityModel(
          id: 14,
          name: "كفر الشيخ",
          createdAt: "2022-04-14T23:00:21.000000Z",
          updatedAt: "2022-04-14T23:00:21.000000Z"),
      CityModel(
          id: 15,
          name: "الفيوم",
          createdAt: "2022-04-14T23:00:21.000000Z",
          updatedAt: "2022-04-14T23:00:21.000000Z"),
      CityModel(
          id: 16,
          name: "بني سويف",
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      CityModel(
          id: 17,
          name: "مطروح",
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      CityModel(
          id: 18,
          name: "شمال سيناء",
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      CityModel(
          id: 19,
          name: "جنوب سيناء",
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      CityModel(
          id: 20,
          name: "المنيا",
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      CityModel(
          id: 21,
          name: "أسيوط",
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      CityModel(
          id: 22,
          name: "سوهاج",
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      CityModel(
          id: 23,
          name: "قنا",
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      CityModel(
          id: 24,
          name: "البحر الأحمر",
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      CityModel(
          id: 25,
          name: "الأقصر",
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      CityModel(
          id: 26,
          name: "أسوان",
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      CityModel(
          id: 27,
          name: "الواحات",
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z"),
      CityModel(
          id: 28,
          name: "الوادي الجديد",
          createdAt: "2022-04-14T23:00:22.000000Z",
          updatedAt: "2022-04-14T23:00:22.000000Z")
    ];
    sectionsList.value = [
      SectionModel(
          id: 1,
          name: "علمي",
          createdAt: "2022-04-14 23:00:22",
          updatedAt: "2022-04-14 23:00:22"),
      SectionModel(
          id: 2,
          name: "أدبي",
          createdAt: "2022-04-14 23:00:22",
          updatedAt: "2022-04-14 23:00:22"),
      SectionModel(
          id: 3,
          name: "غير ذلك",
          createdAt: "2022-04-14 23:00:22",
          updatedAt: "2022-04-14 23:00:22")
    ];
    genderList.value = [
      GenderModel(
          id: 1,
          name: "ذكر",
          createdAt: "2022-04-14T23:00:21.000000Z",
          updatedAt: "2022-04-14T23:00:21.000000Z"),
      GenderModel(
          id: 2,
          name: "أنثى",
          createdAt: "2022-04-14T23:00:21.000000Z",
          updatedAt: "2022-04-14T23:00:21.000000Z")
    ];

    for (var element in classesList) {
      classes.add(element.name!);
      classesId.addAll({element.name!: element.id!});
    }
    for (var element in cityList) {
      city.add(element.name!);
      citiesId.addAll({element.name!: element.id!});
    }
    for (var element in sectionsList) {
      sections.add(element.name!);
      sectionsId.addAll({element.name!: element.id!});
    }
    for (var element in genderList) {
      genders.add(element.name!);
      gendersId.addAll({element.name!: element.id!});
    }
    city.refresh();
    citiesId.refresh();
  }

  getIDDevise() async {
    var idDevice;
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      log(androidInfo.id.toString());
      idDevice = androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      log('Running on ${iosInfo.identifierForVendor}');
      idDevice = iosInfo.identifierForVendor;
    }
    log("idDevice " + idDevice.toString());
    return idDevice;
  }

  register(BuildContext context) async {
    if (sectionName.value == "division".tr) {
      return showCustomSnackBar(
          context: context,
          title: "note".tr,
          deck: "يجب عليك اختيار الشعبة",
          contentType: ContentType.failure);
    } else if (classesName.value == "chooseYear".tr) {
      return showCustomSnackBar(
          context: context,
          title: "note".tr,
          deck: "يجب عليك اخيتار السنة الدراسية",
          contentType: ContentType.failure);
    } else if (genderName.value ==
        "${"nationality".tr} ${Platform.isIOS ? "*" : null}") {
      return showCustomSnackBar(
          context: context,
          title: "note".tr,
          deck: "يجب عليك اخيتار اذا كنت ذكر ام انثي",
          contentType: ContentType.failure);
    } else if (year.value == "المرحله الدراسيه") {
      return showCustomSnackBar(
          context: context,
          title: "note".tr,
          deck: "يجب عليك اختيار المرحلة الدراسية",
          contentType: ContentType.failure);
    } else if (cityName.value ==
        "${"governorate".tr} ${Platform.isIOS ? "*" : null}") {
      return showCustomSnackBar(
          context: context,
          title: "note".tr,
          deck: "يجب عليك اختيار المحافظة",
          contentType: ContentType.failure);
    } else {
      loading.value = true;
      await _firebaseMessaging.getToken().then((value) => token = value);
      idDevice = await getIDDevise();
      debugPrint(token.toString());
      // ignore: use_build_context_synchronously
      await services.register(
          context,
          RegisterModel(
            phone: phone.value,
            password: password.value,
            email: email.value,
            birthday: birthday.value,
            cityId: "${cityId.value}",
            edara: department.value,
            firstName: firstName.value,
            genderId: "${genderId.value}",
            gradeId: gradeId.value,
            lastName: lastName.value,
            parentName: parentName.value,
            parentPhone: parentPhone.value,
            password2: password2.value,
            school: school.value,
            studentClassId: "${studentClassId.value}",
            studentSectionId: "${studentSectionId.value}",
            token: token,
            deviceId: idDevice,
            university: university.value,
            faculty: faculty.value,
            department: department.value,
          ));
      loading.value = false;
    }
  }

  registerUniversity(BuildContext context) async {
    // final sectionName = "division".tr.obs;
    // final classesName = "chooseYear".tr.obs;
    // final genderName = "${"nationality".tr} ${Platform.isIOS?"*":null}".obs;
    // final year = "المرحله الدراسيه".obs;
    // final cityName =  "${"governorate".tr} ${Platform.isIOS?"*":null}".obs;
    if (classesName.value == "chooseYear".tr) {
      return showCustomSnackBar(
          context: context,
          title: "note".tr,
          deck: "يجب عليك اخيتار السنة الدراسية",
          contentType: ContentType.failure);
    } else if (genderName.value ==
        "${"nationality".tr} ${Platform.isIOS ? "*" : null}") {
      return showCustomSnackBar(
          context: context,
          title: "note".tr,
          deck: "يجب عليك اخيتار اذا كنت ذكر ام انثي",
          contentType: ContentType.failure);
    } else if (year.value == "المرحله الدراسيه") {
      return showCustomSnackBar(
          context: context,
          title: "note".tr,
          deck: "يجب عليك اختيار المرحلة الدراسية",
          contentType: ContentType.failure);
    } else if (cityName.value ==
        "${"governorate".tr} ${Platform.isIOS ? "*" : null}") {
      return showCustomSnackBar(
          context: context,
          title: "note".tr,
          deck: "يجب عليك اختيار المحافظة",
          contentType: ContentType.failure);
    } else {
      loading.value = true;
      await _firebaseMessaging.getToken().then((value) => token = value);
      idDevice = await getIDDevise();
      debugPrint(token.toString());
      // ignore: use_build_context_synchronously
      await services.register(
          context,
          RegisterModel(
            phone: phone.value,
            password: password.value,
            email: email.value,
            birthday: birthday.value,
            cityId: "${cityId.value}",
            edara: department.value,
            firstName: firstName.value,
            genderId: "${genderId.value}",
            gradeId: gradeId.value,
            lastName: lastName.value,
            parentName: parentName.value,
            parentPhone: parentPhone.value,
            password2: password2.value,
            school: school.value,
            studentClassId: "${studentClassId.value}",
            studentSectionId: "${studentSectionId.value}",
            token: token,
            deviceId: idDevice,
            university: university.value,
            faculty: faculty.value,
            department: department.value,
          ));
      loading.value = false;
    }
  }
}
