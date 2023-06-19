import 'package:edu_lens/responsive.dart';
import 'package:flutter/material.dart';

import '../mobile/create_account_view.dart';
import '../windows/regester_student/register_screen.dart';

class RegisterCommon extends StatelessWidget {
  const RegisterCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Responsive(mobile: CreateAccountView(), desktop: RegisterScreen());
  }
}
