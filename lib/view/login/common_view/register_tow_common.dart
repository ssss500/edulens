import 'package:flutter/material.dart';

import '../../../responsive.dart';
import '../mobile/create_account_view_tow.dart';
import '../windows/regester_student/register_two_screen.dart';

class RegisterTwoCommon extends StatelessWidget {
  const RegisterTwoCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile:  CreateAccountViewTow(), desktop: RegisterTwoScreen());
  }
}
