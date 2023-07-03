import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/view/package_teacher/package_teacher_windows/packages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/package_controller.dart';
import '../../../responsive.dart';
import '../package_teacher_mobile/packages_view.dart';

class PackageCommon extends GetView<PackageController> {
  const PackageCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(PackageController());
    return const Responsive(mobile: PackagesView(), desktop: Packages());
  }
}
