import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:edu_lens/services/login_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final services = LoginService();
  final password = "".obs;
  final phone = "".obs;
  final loading = false.obs;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  var token, idDevice;

  login(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();

    loading.value = true;
    await _firebaseMessaging
        .getToken()
        .then((value) => token = value);
    idDevice = await getIDDevise();
    debugPrint(token.toString());
    await services.login(context, password: password.value, phone: phone.value,deviceId:idDevice,token:token);
    loading.value = false;
  }
  getIDDevise() async {
    var idDevice;
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      // log(androidInfo.model);
      // log(androidInfo.id);
      // log(androidInfo.device);
      log(androidInfo.id.toString());
      // log(androidInfo.version);
      // idDevice = androidInfo.board;
      idDevice = androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

      log('Running on ${iosInfo.identifierForVendor}');
      idDevice = iosInfo.identifierForVendor;
    }
    log("idDevice " + idDevice.toString());
    return idDevice;
  }
}
