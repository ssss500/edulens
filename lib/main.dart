import 'dart:io';
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
import 'package:fvp/fvp.dart';
// import 'package:fvp/fvp.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_protector/screen_protector.dart';
import 'package:windows_single_instance/windows_single_instance.dart';
import 'firebase_options.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:window_manager/window_manager.dart';
import 'view/not_found_route_view.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

if(Platform.isWindows||Platform.isMacOS){
  registerWith(); // in main(), or anywhere before creating a player

  await windowManager.ensureInitialized();
  WindowsSingleInstance.ensureSingleInstance( args,
      "custom_identifier",
      onSecondWindow: (args) {
      });
  WindowOptions windowOptions = const
  WindowOptions(
  center: true,
   // backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
    windowButtonVisibility: true,
  );
  windowManager.setResizable(true);
  windowManager.setFullScreen(true);
//  windowManager.setMaximumSize(const Size(1400,780));
  windowManager.setMinimumSize(const Size(1450,540));

  windowManager.center();
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  try{
    if(Platform.isWindows) channel();
    }catch(e){
    debugPrint("error windows channel : $e");
  }
  }
  //await Firebase.initializeApp();

  DioUtilNew.getInstance();
  await CacheHelper.init();
  await GetStorage.init();
  if (Platform.isIOS||Platform.isAndroid) {
    await ScreenProtector.preventScreenshotOff();
  }

//   if(Platform.isWindows ){
//     Size size = await DesktopWindow.getWindowSize();
// // setting min and max with the same size to prevent resizing
//     await DesktopWindow.setMinWindowSize(Size(1920,1080));
//     await DesktopWindow.setMaxWindowSize(Size(1920,1080));
//   }

  if (Platform.isAndroid || Platform.isIOS){
    try{
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }catch(e){
      debugPrint("error firebase : $e");
    }
  } else {
    // awaitait Firebase.initializeApp(
    //
    // );
    try {
      Size size = await DesktopWindow.getWindowSize();
      print(size);
      DesktopWindow.setMinWindowSize(const Size(1300, 800));
      DesktopWindow.setMaxWindowSize(const Size(1300, 800));
      DesktopWindow.resetMaxWindowSize();
      DesktopWindow.toggleFullScreen();
      //DesktopWindow.setFullScreen(true);
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
Future<void> channel() async {
  try {
    const platform = MethodChannel('my_channel');

    final bool result = await platform.invokeMethod('protectScreen');


  } on PlatformException catch (e) {
    print('Error: ${e.message}');
    print('Error hi: ${e.message}');
  }
}


