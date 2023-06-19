import 'package:flutter/material.dart';

import '../../../responsive.dart';
import '../mobile/login_view.dart';
import '../windows/login_screen.dart';

class LoginViewCommon extends StatelessWidget {
  const LoginViewCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: LoginView(), desktop: LoginScreen());
  }
}
