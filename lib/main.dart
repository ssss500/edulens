import 'dart:io';
import 'package:edu_lens/binding/view_model_binding.dart';
import 'package:edu_lens/controllers/main_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/cashe_helper.dart';
import 'package:edu_lens/helper/dio_integration.dart';
import 'package:edu_lens/routes/routes.dart';
import 'package:edu_lens/routes/routes_names.dart';
import 'package:edu_lens/utils/lacale_string.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:screen_protector/screen_protector.dart';
import 'firebase_options.dart';
import 'package:desktop_window/desktop_window.dart';

import 'view/not_found_route_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await Firebase.initializeApp();

  DioUtilNew.getInstance();
  await CacheHelper.init();
  await GetStorage.init();
  if (Platform.isIOS) {
    await ScreenProtector.preventScreenshotOff();
  }

//   if(Platform.isWindows ){
//     Size size = await DesktopWindow.getWindowSize();
// // setting min and max with the same size to prevent resizing
//     await DesktopWindow.setMinWindowSize(Size(1920,1080));
//     await DesktopWindow.setMaxWindowSize(Size(1920,1080));
//   }
  if (Platform.isAndroid || Platform.isIOS) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    try {
      Size size = await DesktopWindow.getWindowSize();
      print(size);

      DesktopWindow.setMinWindowSize(const Size(1530, 800));
      DesktopWindow.setMaxWindowSize(const Size(1530, 800));

      DesktopWindow.resetMaxWindowSize();
      DesktopWindow.toggleFullScreen();
      DesktopWindow.setFullScreen(true);
    } catch (e) {}
  }

  // final token = await CacheHelper.getData(key: AppConstants.token);
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Container(
        color: AppConstants.primaryColor,
        child: Text(
          details.exception.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ), // TextStyle
        ), // Column
      ), // Container
    ); // Material
  };
  if (GetStorage().read("listTeacherLoves") == null) {
    await GetStorage().write("listTeacherLoves", '');
  }
  MainController().onInit();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(GetMaterialApp(
    defaultTransition: Transition.fadeIn,
    opaqueRoute: Get.isOpaqueRouteDefault,
    popGesture: Get.isPopGestureEnable,
    transitionDuration: Get.defaultDialogTransitionDuration,
    textDirection: TextDirection.rtl,
    translations: LocaleString(),
    initialRoute: RoutesNames.splash,
    // initialBinding: ViewModelBinding(),
    locale: const Locale('ar', 'EG'),
    getPages: Routes.pages,
    unknownRoute: GetPage(
        name: RoutesNames.notFoundRoutes, page: () => const NotFoundView()),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: GoogleFonts.cairo().fontFamily,
      platform: TargetPlatform.iOS,
    ),
  ));
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//
//     return GetMaterialApp(
//       defaultTransition: Transition.fadeIn,
//       opaqueRoute: Get.isOpaqueRouteDefault,
//       popGesture: Get.isPopGestureEnable,
//       transitionDuration: Get.defaultDialogTransitionDuration,
//       textDirection: TextDirection.rtl,
//       translations: LocaleString(),
//       locale: const Locale('ar', 'EG'),
//       debugShowCheckedModeBanner: false,
//       home: token == null ? const HomeLogin() : Home(),
//       // home: Scaffold(
//       //   body: SplachScreen(),
//       // ),
//       theme: ThemeData(
//         fontFamily: 'Font1',
//
//         // fontFamily: GoogleFonts.tajawal().fontFamily,
//         // fontFamily: GoogleFonts.balooBhaijaan2().fontFamily,
//         // fontFamily: GoogleFonts.notoSansArabic().fontFamily,
//         platform: TargetPlatform.iOS,
//       ),
//     );
//   }
// }
