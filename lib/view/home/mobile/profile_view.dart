import 'dart:io';

import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/controllers/package_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/cashe_helper.dart';
import 'package:edu_lens/routes/routes_names.dart';
import 'package:edu_lens/view/login/mobile/home_login_view.dart';
import 'package:edu_lens/view/widget/custom_social_media_icons.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends GetView<HomeController> {
 const  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                // height: 180,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: AppConstants.lightPrimaryColor,
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(-4, -4),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Obx(
                  () => controller.studentProfile.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: AppConstants.lightPrimaryColor,
                        ))
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Expanded(
                                      flex: 2,
                                      child: Image(
                                          image: AssetImage(
                                              "assets/images/male.png")),
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              children: [
                                                CustomText(text: "الاسم:"),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                CustomText(
                                                  text:
                                                      "${controller.studentProfile[0].firstName} ${controller.studentProfile[0].lastName}",
                                                  fontSize: 24,
                                                  alignment: Alignment.centerRight,
                                                  textAlign: TextAlign.start,
                                                  widthContainer: MediaQuery.of(context).size.width-190,
                                                  heightContainer: 50.0,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                CustomText(
                                                    text: "الفرقه الدراسيه :",
                                                    fontSize: 18),
                                                CustomText(
                                                  text:
                                                      "${controller.listYears[int.parse(controller.studentProfile[0].studentClassId.toString()) - 1].name}",
                                                  fontSize: 18,
                                                  widthContainer: MediaQuery.of(context).size.width-258,
                                                  textAlign: TextAlign.start,
                                                  alignment: Alignment.centerRight,
                                                  heightContainer: 20.0,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          CustomText(
                                              text: "رقم ولي الامر",
                                              fontSize: 18),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomText(
                                              text:
                                                  "${controller.studentProfile[0].parentPhone}",
                                              fontSize: 18)
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 2,
                                      height: 60,
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          CustomText(
                                              text: "رقم الطالب ",
                                              fontSize: 18),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomText(
                                              text:
                                                  "${controller.studentProfile[0].phone}",
                                              fontSize: 18)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (!controller.appleAndGoogleBool.value)
              InkWell(
                onTap: () {
                  // showSimpleDialog(context);
                },
                child: Obx(
                  () => controller.studentProfile.isEmpty
                      ? const SizedBox(
                          height: 40,
                          child: Center(
                              child: CircularProgressIndicator(
                            color: AppConstants.lightPrimaryColor,
                          )))
                      : Container(
                          height: 40,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: AppConstants.lightPrimaryColor,
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: Offset(2, 2),
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: Offset(-4, -4),
                                )
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: AppConstants.lightPrimaryColor,
                              )),
                          child: Center(
                              child: CustomText(
                                  text:
                                      "رصيدك: ${controller.studentProfile[0].bucket} ج")),
                        ),
                ),
              ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!controller.appleAndGoogleBool.value)
                      buildItem(
                        onTap: () {
                          Get.toNamed(RoutesNames.purchasedLecture);
                        },
                        // color: Colors.blue,
                        icon: Icons.book,
                        text: "purchasedLectures".tr),
                    // buildItem(
                    //     onTap: () {
                    //       Get.to(() => PackagesView());
                    //     },
                    //     // color: Colors.green,
                    //     icon: Icons.person,
                    //     text: "اختر باقتك"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildItem(
                        onTap: () {
                          if (Platform.isIOS) {
                            Share.share(
                                "https://apps.apple.com/app/edu-lens/id1666623278");
                          } else {
                            Share.share(
                                "https://play.google.com/store/apps/details?id=com.edulens.edulens");
                          }
                        },
                        // color: Colors.red,
                        icon: Icons.share,
                        text: "مشاركة التطبيق"),
                    if (!controller.appleAndGoogleBool.value)
                      buildItem(
                        onTap: () {
                          PackageController packageController=Get.put(PackageController());
                          packageController.getPackages();
                          // Get.to(() =>   ChooseTeacherForPackages());
                          Get.toNamed(RoutesNames.packageView);
                        },
                        icon: Icons.wallet,
                        text: "اختر باقتك"),
                    // buildItem(
                    //     onTap: () {},
                    //     // color: Colors.black,
                    //     icon: Icons.phone,
                    //     text: "اتصل بنا"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildItem(
                        onTap: () {
                          Get.toNamed(RoutesNames.howWeAre);
                        },
                        // color: Colors.purple,
                        icon: Icons.search_off,
                        text: "من نحن"),
                    buildItem(
                        onTap: () async {
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
                        // color: Colors.yellow,
                        icon: Icons.star,
                        text: "تقييم التطبيق"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                if (Platform.isIOS)
                  InkWell(
                    onTap: () async {
                      Get.dialog(Dialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(23.0))),
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Form(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const SizedBox(
                                  height: 25.0,
                                ),
                                const Icon(
                                  Icons.delete,
                                  size: 60,
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  height: 25.0,
                                ),
                                CustomText(
                                  text: 'حذف الحساب نهائيا',
                                  fontSize: 24,
                                ),
                                const SizedBox(
                                  height: 25.0,
                                ),
                                CustomText(
                                  text:
                                      'هل انت متاكد من حذف الحساب بشكل نهائي؟',
                                  fontSize: 17,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    TextButton(
                                      onPressed: () async {
                                        GetStorage().remove("listTeacherLoves");
                                        await CacheHelper.clearData();
                                        Get.offAll(() => HomeLogin());
                                      },
                                      child: CustomText(
                                        text: 'حذف',
                                        color: Colors.red.shade400,
                                      ),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(Get.context!).pop();
                                        },
                                        child: const Text('الغاء'))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ));
                      // await CacheHelper.clearDa();
                      // Get.offAll(() => HomeLogin());
                    },
                    child: Center(
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            boxShadow: const [
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: AppConstants.primaryColor,
                            )),
                        child: CustomText(text: "deleteAccount".tr),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    GetStorage().remove("listTeacherLoves");
                    await CacheHelper.clearData();
                    Get.offAll(() =>  const HomeLogin());
                  },
                  child: Center(
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: AppConstants.primaryColor,
                          )),
                      child: CustomText(text: "logoutText".tr),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                customSocialMediaIcons(),

                CustomText(
                  text: "Developed By: Edulens",
                  fontSize: 20,
                  color: Colors.black,
                )
              ],
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  Widget buildItem(
          {required String text,
          required IconData icon,
          required VoidCallback onTap}) =>
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: onTap,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 6,
              child: SizedBox(
                height: 150,
                width: 120,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: SizedBox(
                            height: 45,
                            width: 45,
                            child: Icon(icon, color: AppConstants.primaryColor),
                          ),
                        ),
                        CustomText(
                          text: text,
                        ),
                        // Text(text),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 1.7,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppConstants.primaryColor,
                                borderRadius: BorderRadius.circular(19)),
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ),
        ),
      );
}
