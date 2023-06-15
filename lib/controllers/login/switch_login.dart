import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/cashe_helper.dart';
import 'package:edu_lens/view/login/mobile/home_login_view.dart';
import 'package:flutter/material.dart';

import '../../view/home/mobile/home.dart';

class SwitchLogin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // final token = CacheHelper.getData(key: AppConstants.token);

    return
      CacheHelper.getData(key: AppConstants.token) == null ?   HomeLogin() : Home();
  }
}
