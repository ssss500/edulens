import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/widget/custom_dialog/snackBar.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

getVersionName() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  versionName.value = packageInfo.version;
}

RxString versionName = ''.obs;

Widget customSocialMediaIcons() {
  return Column(
    // crossAxisAlignment: CrossAxisAlignment.center,
    // mainAxisAlignment: MainAxisAlignment.center,
    // mainAxisSize: MainAxisSize.max,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            SocialButton(
              function: () async {
                showAdaptiveActionSheet(
                  context: Get.context!,
                  title: Text(
                    'للتواصل معا ايديو لينس',
                    style: GoogleFonts.cairo(
                        fontSize: 27,
                        color: AppConstants.lightPrimaryColor,
                        fontWeight: FontWeight.bold),
                    // style: TextStyle(
                    //     fontSize: 27, color: AppConstants.primaryColor)
                  ),
                  androidBorderRadius: 30,
                  actions: <BottomSheetAction>[
                    BottomSheetAction(
                        title: SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.copy),
                                iconSize: 25,
                                onPressed: () {
                                  Clipboard.setData(const ClipboardData(
                                          text: "01092884278"))
                                      .then((_) {
                                        Get.back();
                                    showCustomSnackBar(
                                        context: Get.context!,
                                        title: "note".tr,
                                        deck: "تم نسخ الرقم بنجاح",
                                        contentType: ContentType.success);
                                  });
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.phone),
                                iconSize: 25,
                                onPressed: () {
                                  launchUrl(Uri(scheme: 'tel', path: "01092884278"));
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "01092884278",
                                style: GoogleFonts.cairo(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () async {
                                  final Uri _url = Uri.parse(
                                      'whatsapp://send?phone=+201092884278');

                                  await launchUrl(_url);
                                },
                                child: Image.asset(
                                  "assets/images/whatsapp.png",
                                  height: 35,
                                  width: 35,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                "assets/images/vodafone.png",
                                height: 35,
                                width: 35,
                              ),
                            ],
                          ),
                        ),
                        onPressed: (context) async {
                          // final Uri _url =
                          // Uri.parse('whatsapp://send?phone=+201022535966');
                          // await launchUrl(_url);
                        }),
                    BottomSheetAction(
                        title: SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.copy),
                                iconSize: 25,
                                onPressed: () {
                                  Clipboard.setData(const ClipboardData(
                                          text: "01153070885"))
                                      .then((_) {
                                        Get.back();
                                    showCustomSnackBar(
                                        context: Get.context!,
                                        title: "note".tr,
                                        deck: "تم نسخ الرقم بنجاح",
                                        contentType: ContentType.success);
                                  });
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.phone),
                                iconSize: 25,
                                onPressed: () {
                                  launchUrl(Uri(scheme: 'tel', path: "01153070885"));
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "01153070885",
                                style: GoogleFonts.cairo(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () async {
                                  final Uri _url = Uri.parse(
                                      'whatsapp://send?phone=+201153070885');

                                  await launchUrl(_url);
                                },
                                child: Image.asset(
                                  "assets/images/whatsapp.png",
                                  height: 35,
                                  width: 35,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                "assets/images/vodafone.png",
                                height: 35,
                                width: 35,
                              ),
                            ],
                          ),
                        ),
                        onPressed: (context) async {
                          // final Uri _url =
                          // Uri.parse('whatsapp://send?phone=+201022535966');
                          // await launchUrl(_url);
                        }),
                    BottomSheetAction(
                        title: SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.copy),
                                iconSize: 25,
                                onPressed: () {
                                  Clipboard.setData(const ClipboardData(
                                          text: "01099613267"))
                                      .then((_) {
                                        Get.back();
                                    showCustomSnackBar(
                                        context: Get.context!,
                                        title: "note".tr,
                                        deck: "تم نسخ الرقم بنجاح",
                                        contentType: ContentType.success);
                                  });
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.phone),
                                iconSize: 25,
                                onPressed: () {
                                  launchUrl(Uri(scheme: 'tel', path: "01099613267"));
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "01099613267",
                                style: GoogleFonts.cairo(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () async {
                                  final Uri _url = Uri.parse(
                                      'whatsapp://send?phone=+201099613267');

                                  await launchUrl(_url);
                                },
                                child: Image.asset(
                                  "assets/images/whatsapp.png",
                                  height: 35,
                                  width: 35,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                "assets/images/vodafone.png",
                                height: 35,
                                width: 35,
                              ),
                            ],
                          ),
                        ),
                        onPressed: (context) async {
                          // final Uri _url =
                          // Uri.parse('whatsapp://send?phone=+201022535966');
                          // await launchUrl(_url);
                        }),
                  ],
                  cancelAction: CancelAction(
                      title: const Text(
                          'Close')), // onPressed parameter is optional by default will dismiss the ActionSheet
                );
              },
              height: 45.0,
              width: 45.0,
              image: Container(
                  decoration: BoxDecoration(
                      color: AppConstants.lightPrimaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.phone,
                    size: 30,
                    color: Colors.white,
                  )),
            ),
            SocialButton(
              function: () async {
                await launchUrlString(
                    "https://www.facebook.com/EdulensEgy?mibextid=ZbWKwL",
                    mode: LaunchMode.externalApplication);
              },
              image: Image.asset("assets/images/facebook.png"),
            ),
            SocialButton(
              function: () async {
                await launchUrlString("https://www.edu-lens.com",
                    mode: LaunchMode.externalApplication);
              },
              height: 50,
              width: 50,
              image: Image.asset("assets/images/logo-edu-lens.png"),
            ),
            SocialButton(
              function: () async {
                await launchUrlString("https://www.youtube.com/@edulens1553",
                    mode: LaunchMode.externalApplication);
              },
              image: Image.asset("assets/images/youtube.png"),
            ),
            SocialButton(
              function: () async {
                await launchUrlString(
                    "https://www.tiktok.com/@edulens.egy?_t=8ZK4XDVAhnx&_r=1",
                    mode: LaunchMode.externalApplication);
              },
              image: Image.asset("assets/images/tiktok.png"),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Obx(
  ()=>CustomText(
          text: "V $versionName",
          color: AppConstants.lightPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      const SizedBox(
        height: 30,
      ),
    ],
  );
}

class SocialButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var image;
  double height;
  double width;
  final Function()? function;

  SocialButton(
      {this.image, this.function, this.height = 35.0, this.width = 35.0});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      // padding: EdgeInsets.zero,
      child: SizedBox(
        height: height,
        width: width,
        child: image,
      ),
    );
  }
}
