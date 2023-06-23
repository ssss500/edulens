import 'dart:io';
import 'package:edu_lens/view/widget/custom_buttom_deflated.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

showDialogDelete(fun) {
  return AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0))),
    title: const Icon(
      Icons.delete,
      size: 50,
      color: Colors.red,
    ),
    content: SizedBox(
        height: 40,
        child: CustomText(
          fontSize: 20,
          text: "هل انت متاكد من حذف العنصر؟",
          alignment: Alignment.center,
        )),
    actions: <Widget>[
      Row(
        children: [
          Expanded(
            child: InkWell(
              child: CustomText(
                text: 'حذف',
                color: Colors.red,
              ),
              onTap: () => fun(),
            ),
          ),
          Expanded(
              child: CustomButtonDeflated(
            text: "exitText",
            function: () {},
          )),
        ],
      )
    ],
  );
}

alertDialogDone() {
  return AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0))),
    title: Column(
      children: [
        Image.asset(
          "assets/images/done.gif",
          height: 105.0,
          width: 105.0,
        ),
        Center(child: CustomText(text: 'note'.tr)),
      ],
    ),
    content: SizedBox(
        height: 54,
        child: CustomText(
          text: "successRegistrationText",
        )),
    actions: <Widget>[
      CustomButtonDeflated(
        text: "exitText",
        function: () {},
      )
    ],
  );
}

showAlertDialog({context, text}) {
  // set up the button
  Widget okButton = CustomButtonDeflated(
    text: "exit".tr,
    function: () => Get.back(),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            "assets/images/error.gif",
            height: 105.0,
            width: 105.0,
          ),
          Center(
              child: CustomText(
            text: "note".tr,
          )),
        ],
      ),
    ),
    content: CustomText(
      text: "$text",
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

alertDialogError({context, text, barrierDismissible = false}) {
  // showDialog(
  //   barrierDismissible: barrierDismissible,
  //   context: context,
  //   builder: (context) {
  return AlertDialog(
    scrollable: true,
    // <-- Set it to true
    // insetPadding: EdgeInsets.zero,
    // contentPadding: EdgeInsets.zero,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0))),
    title: Image.asset(
      "assets/images/error.gif",
      height: 105.0,
      width: 105.0,
    ),
    // Container(
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: <Widget>[
    //
    //       Center(
    //           child: CustomText(
    //         text: "note".tr,
    //       )),
    //     ],
    //   ),
    // ),
    content: CustomText(
      text: text,
    ),
    actions: <Widget>[
      CustomButtonDeflated(
        text: "exit".tr,
        function: () => Get.back(),
      )
    ],
  );
  //   },
  // );
}

alertDialogWifi( ) {
  showDialog(
    barrierDismissible: false,
    context: Get.context!,
    builder: (context) {
      return Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),

       child: Column(
         mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/wifi.gif",
              height: 105.0,
              width: 105.0,
            ),
            Center(child: CustomText(text: "note".tr)),
            SizedBox(
                height: 54,
                child: CustomText(
                  text: "descriptionForWIFI".tr,
                )),
            CustomButtonDeflated(
              text: "tryAgain".tr,
              function: () async {
                // var result = await Connectivity().checkConnectivity();
                // if (result == ConnectivityResult.none) {
                // } else {
                //   Get.back();
                // }
              },
            ),
            const SizedBox(height: 20,)
          ],
        ) ,
      );
    },
  );
}

showExitDialog(context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        title: Column(
          children: const [
            Center(child: Text("!تأكيد الخروج")),
          ],
        ),
        content: const Text(
          "هل أنت متأكد من انك تريد الخروج؟",
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          Row(
            children: [
              Expanded(
                  child: Center(
                child: CustomButtonDeflated(
                  text: "تاكيد",
                  function: () async {
                    Platform.isAndroid ? SystemNavigator.pop() : exit(0);
                  },
                ),
              )),
              Expanded(
                  child: Center(
                child: CustomButtonDeflated(
                  text: "الغاء",
                  function: () {
                    Get.back();
                  },
                ),
              )),
            ],
          )
        ],
      );
    },
  );
}

Widget ServerClosedDialog() {
  return WillPopScope(
    onWillPop: () => Future.value(false),
    child: AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      title: Column(
        children: [
          Image.asset(
            "assets/images/error.gif",
            height: 105.0,
            width: 105.0,
          ),
          Center(
              child: CustomText(
            text: " ناسف !",
            fontSize: 30,
          )),
        ],
      ),
      content: SizedBox(
          height: 90,
          child: CustomText(
            fontSize: 20,
            text: "يتم الان الصيانة علي السرفر يورجي المحاولة في وقت لاحق",
          )),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
          child: CustomButtonDeflated(
            height: 40,
            width: MediaQuery.of(Get.context!).size.width,
            text: "الخروج من البرنامج",
            fontSize: 40,
            function: () async {
              Platform.isAndroid ? SystemNavigator.pop() : exit(0);
            },
          ),
        ),
      ],
    ),
  );
}

Widget DialogForScreenShotIOS() {
  return WillPopScope(
    onWillPop: () => Future.value(false),
    child: AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      title: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Image.asset(
          "assets/images/screenshoti.png",
        ),
      ),
      content: Container(
          height: 90,
          child: CustomText(
            fontSize: 20,
            text: "شوفتك يا اللي بتسجل الشاشة و هجيبك👀👀",
          )),
      actions: <Widget>[
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
              child: Container(
                child: CustomButtonDeflated(
                  height: 45,
                  width: MediaQuery.of(Get.context!).size.width,
                  text: "الخروج من البرنامج",
                  color: Colors.red,
                  fontSize: 40,
                  function: () async {
                    Platform.isAndroid ? SystemNavigator.pop() : exit(0);
                  },
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    ),
  );
}

Widget DialogRootAndroid() {
  return WillPopScope(
    onWillPop: () => Future.value(false),
    child: AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      title: Column(
        children: [
          Image.asset(
            "assets/images/error.gif",
            height: 105.0,
            width: 105.0,
          ),
          Center(
              child: CustomText(
            text: " ناسف !",
            fontSize: 30,
          )),
        ],
      ),
      content: SizedBox(
          height: 90,
          child: CustomText(
            fontSize: 20,
            text: "لا يمكن فتح البرنامج .. قم بالغاء الروت وأعد المحاولة",
          )),
      actions: <Widget>[
        CustomButtonDeflated(
          height: 40,
          width: MediaQuery.of(Get.context!).size.width,
          text: "الخروج من البرنامج",
          fontSize: 40,
          function: () async {
            Platform.isAndroid ? SystemNavigator.pop() : exit(0);
          },
        ),
      ],
    ),
  );
}
