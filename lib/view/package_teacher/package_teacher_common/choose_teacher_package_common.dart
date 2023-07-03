import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../controllers/package_controller.dart';
import '../../../responsive.dart';
import '../package_teacher_mobile/choose_teacher_for_package.dart';
import '../package_teacher_windows/choose_teacher_from_package_windows.dart';

class ChooseTeacherFromPackageCommon extends GetView<PackageController> {
  const ChooseTeacherFromPackageCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: ChooseTeacherForPackages(),
        desktop: ChooseTeacherFromPackageWindows());
  }
}
