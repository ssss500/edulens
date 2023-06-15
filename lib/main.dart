import 'dart:io';
import 'package:edu_lens/binding/view_model_binding.dart';
import 'package:edu_lens/controllers/main_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/cashe_helper.dart';
import 'package:edu_lens/helper/dio_integration.dart';
import 'package:edu_lens/routes.dart';
import 'package:edu_lens/utils/lacale_string.dart';
import 'package:edu_lens/view/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_protector/screen_protector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  DioUtilNew.getInstance();
  await CacheHelper.init();
  await GetStorage.init();
  if (Platform.isIOS) {
    await ScreenProtector.preventScreenshotOff();
  }
// if(Platform.isAndroid||Platform.isIOS ){
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
// }
// if(Platform.isWindows){
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform, // for web
//   );
// }

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
    initialBinding: ViewModelBinding(),
    locale: const Locale('ar', 'EG'),
    debugShowCheckedModeBanner: false,
    // home: token == null ? const LoginView() : Home(),
   home:
    const RootScreen(),
    // Scaffold(
    //   body: SplachScreen(),
    // ),
getPages: Routes.pages,
    theme: ThemeData(
      // fontFamily: 'Font1',

      // fontFamily: GoogleFonts.tajawal().fontFamily,
      fontFamily: GoogleFonts.cairo().fontFamily,
      // fontFamily: GoogleFonts.notoSansArabic().fontFamily,
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

