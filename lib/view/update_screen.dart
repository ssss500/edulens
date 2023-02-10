import 'dart:developer';
import 'dart:io';

import 'package:edu_lens/view/widget/custom_app_bar.dart';
import 'package:edu_lens/view/widget/custom_buttom.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';


class UpdateScreen extends StatelessWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'تحديث اجباري',
      bakeButtonBool: false,
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.asset(
                'assets/images/update_screen2.png',
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            function: () async {
              if (Platform.isIOS) {
                final Uri _url = Uri.parse(
                    "https://apps.apple.com/app/edu-lens/id1666623278");
                await launchUrl(
                  _url,
                  mode: LaunchMode.externalApplication,
                );
              } else {
                final Uri _url = Uri.parse(
                    "https://play.google.com/store/apps/details?id=com.edulens.edulens");

                await launchUrl(
                  _url,
                  mode: LaunchMode.externalApplication,
                );
              }
            },
            text: 'تحديث',
          )
        ],
      ),
    );
  }
}
