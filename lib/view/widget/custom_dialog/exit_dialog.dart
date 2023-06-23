import 'dart:io';
import 'package:edu_lens/view/widget/custom_buttom_deflated.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ExitDialog extends StatelessWidget {
   const ExitDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      title: const Column(
        children: [
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
  }
}
