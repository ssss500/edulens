import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/view/home/windows/packages.dart';
import 'package:edu_lens/view/package_teacher/packages_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../controllers/package_controller.dart';
import '../../../responsive.dart';

class PackageCommon extends GetView<PackageController> {
  const PackageCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(PackageController());
    return const Responsive(mobile: PackagesView(), desktop: Packages());
  }
}
