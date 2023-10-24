import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:edu_lens/controllers/update_windows_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/dio_integration.dart';
import 'package:edu_lens/model/app_version_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

import '../view/update_screen.dart';
import '../view/widget/custom_social_media_icons.dart';

// import 'package:package_info_plus/package_info_plus.dart';
final _shorebirdCodePush = ShorebirdCodePush();

class MainController extends GetxController {
  final dio = DioUtilNew.dio;
  final appVersion = <AppVersionModel>[].obs;
  int? _currentPatchVersion;
  bool _isCheckingForUpdate = false;

  @override
  Future<void> onInit() async {
    super.onInit();
    // TODO: implement onInit
    if (Platform.isIOS || Platform.isAndroid) {
      checkUpdate();
      notificationMethod();
    } else if (Platform.isWindows) {
      UpdateWindowsController().checkForUpdates();
    }
    _checkForUpdate();
  }

  Future<void> _checkForUpdate() async {
    try {
      _shorebirdCodePush.currentPatchNumber().then((currentPatchVersion) {
        // if (!mounted) return;

        _currentPatchVersion = currentPatchVersion;
        update();
      });
      _isCheckingForUpdate = true;
      update();

      // Ask the Shorebird servers if there is a new patch available.
      final isUpdateAvailable =
          await _shorebirdCodePush.isNewPatchAvailableForDownload();

      if (isUpdateAvailable) {
// If there is a new patch available, download it.
        await _shorebirdCodePush.downloadUpdateIfAvailable();
      }
      // remoteConfigFun();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  checkUpdate() async {
    Timer(Duration(milliseconds: 3500), () async {
      appVersion.value = (await getAppVersion())!;
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      var version = packageInfo.buildNumber;
      int.parse(version);
      int platFormName;
      if (GetPlatform.isAndroid) {
        platFormName = int.parse(appVersion[0].androidVersion!);
      } else {
        platFormName = int.parse(appVersion[0].iosVersion!);
      }

      if (int.parse(version) < platFormName) {
        Get.offAll(() => const UpdateScreen());
      }
      getVersionName();
    });
  }

  notificationMethod() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('User granted provisional permission');
    } else {
      log('User declined or has not accepted permission');
    }
  }

  Future<List<AppVersionModel>?> getAppVersion() async {
    try {
      final response = await dio!.post(AppConstants.appVersion,
          data: {"api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"});

      debugPrint("response.statusCode : ${response.statusCode.toString()}");
      debugPrint("response.data : ${response.data.toString()}");
      if (response.statusCode == 200) {
        var map = [response.data];
        final mList = List<AppVersionModel>.from(
            map.map((i) => AppVersionModel.fromJson(i)));
        // = response.data.map((i) => AppVersionModel.fromJson(i));

        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  checkInternet() async {
    ///
    // var isDeviceConnected = false;
    // debugPrint("checkInternet1");
    // Connectivity()
    //     .onConnectivityChanged
    //     .listen((ConnectivityResult result) async {
    //
    // debugPrint("result : $result");
    //   if (result != ConnectivityResult.none) {
    //     debugPrint("checkInternet none");
    //
    //     isDeviceConnected = await InternetConnectionChecker().hasConnection;
    //
    //     if (!isDeviceConnected) {
    //       debugPrint("checkInternet Dialog");
    //
    //       alertDialogWifi();
    //       debugPrint("checkInternet Dialog1");
    //     }
    //   }
    // });
    ///
    // _networkConnectivity.initialise();
    // _networkConnectivity.myStream.listen((source) {
    //   _source = source;
    //   print('source $_source');
    //   // 1.
    //   if(_source.keys.toList()[0]== ConnectivityResult.none){
    //    alertDialogWifi();
    //   }
    // switch (_source.keys.toList()[0]) {
    //   case ConnectivityResult.mobile:
    //     string =
    //     _source.values.toList()[0] ? 'Mobile: Online' : 'Mobile: Offline';
    //     break;
    //   case ConnectivityResult.wifi:
    //     string =
    //     _source.values.toList()[0] ? 'WiFi: Online' : 'WiFi: Offline';
    //     break;
    //   case ConnectivityResult.none:
    //   default:
    //     string = 'Offline';
    // }

    // });
  }
}

// class NetworkConnectivity {
//   NetworkConnectivity._();
//
//   static final _instance = NetworkConnectivity._();
//
//   static NetworkConnectivity get instance => _instance;
//   final _networkConnectivity = Connectivity();
//   final _controller = StreamController.broadcast();
//
//   Stream get myStream => _controller.stream;
//
//   // 1.
//   void initialise() async {
//     ConnectivityResult result = await _networkConnectivity.checkConnectivity();
//     _checkStatus(result);
//     _networkConnectivity.onConnectivityChanged.listen((result) {
//       print(result);
//       _checkStatus(result);
//     });
//   }
//
// // 2.
//   void _checkStatus(ConnectivityResult result) async {
//     bool isOnline = false;
//     try {
//       final result = await InternetAddress.lookup('https://edu-lens.com/');
//       isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
//     } on SocketException catch (_) {
//       isOnline = false;
//     }
//     _controller.sink.add({result: isOnline});
//   }
//
//   void disposeStream() => _controller.close();
// }
//
// class MyConnectivity {
//   MyConnectivity._internal();
//
//   static final MyConnectivity _instance = MyConnectivity._internal();
//
//   static MyConnectivity get instance => _instance;
//
//   Connectivity connectivity = Connectivity();
//
//   StreamController controller = StreamController.broadcast();
//
//   Stream get myStream => controller.stream;
//
//   void initialise() async {
//     ConnectivityResult result = await connectivity.checkConnectivity();
//     _checkStatus(result);
//     connectivity.onConnectivityChanged.listen((result) {
//       _checkStatus(result);
//     });
//   }
//
//   void _checkStatus(ConnectivityResult result) async {
//     bool isOnline = false;
//     try {
//       final result = await InternetAddress.lookup('example.com');
//       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//         isOnline = true;
//       } else {
//         isOnline = false;
//       }
//     } on SocketException catch (_) {
//       isOnline = false;
//     }
//     controller.sink.add({result: isOnline});
//   }
//
//   void disposeStream() => controller.close();
// }
