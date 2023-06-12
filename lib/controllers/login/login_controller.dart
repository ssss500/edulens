import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:edu_lens/services/login_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../services/login_service_windows.dart';

class LoginController extends GetxController {
  final services = LoginService();
  final service = LoginWindowsService();
  final password = "".obs;
  final phone = "".obs;
  final loading = false.obs;
  var token = '', idDevice;

  login(BuildContext context) async {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    FocusManager.instance.primaryFocus?.unfocus();

    loading.value = true;
    try {
      await _firebaseMessaging
          .getToken()
          .then((value) => token = value.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    idDevice = await getIDDevise();
    debugPrint(token.toString());
    // ignore: use_build_context_synchronously
    await services.login(context,
        password: password.value.trim(),
        phone: phone.value.trim(),
        deviceId: idDevice,
        token: token);
    loading.value = false;
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
    } else if (Platform.isWindows) {
      WindowsDeviceInfo windowsDeviceInfo = await deviceInfo.windowsInfo;

      idDevice = windowsDeviceInfo.platformId;
    }
    // log("idDevice " + idDevice.toString());
    return idDevice;
  }

  loginForWindows(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();

    loading.value = true;
    // try{
    //   await _firebaseMessaging
    //       .getToken()
    //       .then((value) => token = value.toString());
    // }catch(e){
    //   debugPrint(e.toString());
    // }
    // idDevice = await getIDDevise();
    // debugPrint(token.toString());
    // ignore: use_build_context_synchronously
    await service
        .loginWindows(
          context,
          password: password.value.trim(),
          phone: phone.value.trim(),
        )
        .whenComplete(() => loading.value = false);
  }
}
