import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/home/windows/favourite.dart';
 import 'package:edu_lens/view/home/windows/messages_screen.dart';
import 'package:edu_lens/view/home/windows/packages.dart';
import 'package:edu_lens/view/home/windows/paid_lectures.dart';
import 'package:edu_lens/view/widget/custom_background.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/cashe_helper.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);

    // List<Widget> menuItems=[const HomeView(),const Favourite(),MessageScreen(), PaidLectureScreen(),const Packages(),];
    final size = MediaQuery.of(context).size;
    return CustomBackground(
        child: Padding(
      padding: const EdgeInsets.all(50),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(size.width * 0.02),
              decoration: BoxDecoration(
                color: AppConstants.primaryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              width: size.width / 4.5,
              height: size.height,
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: size.width * .022,
                        backgroundColor: Colors.white54,
                        backgroundImage: const AssetImage(
                          'assets/images/male.png',
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'مرحبا بك, سيف',
                            fontSize: size.width * .019,
                            fontWeight: FontWeight.bold,
                            color: AppConstants.lightPrimaryColor,
                          ),
                          SizedBox(
                            height: size.height * 0.012,
                          ),
                          CustomText(
                            text: 'الصف الثالث الثانوي',
                            fontSize: size.width * .014,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: 'رقم الطالب:', color: Colors.white),
                      CustomText(text: '****01015245', color: Colors.white),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'رقم ولي الأمر:',
                        color: Colors.white,
                      ),
                      CustomText(text: '****01015245', color: Colors.white),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: 'رصيدك:',
                          color: Colors.black,
                          fontSize: size.width * .012,
                          fontWeight: FontWeight.w500),
                      CustomText(
                        text: '120 ج.م.',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * .012,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  const Divider(
                    thickness: 1.5,
                    color: Colors.white,
                  ),
                  // SizedBox(
                  //   height: size.height * 0.025,
                  // ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => Obx(
                              () {
                                return InkWell(
                                  onTap: () {
                                    controller.sideMenuItemIndex.value = index;
                                    if (index == 2) {}
                                    print(controller.sideMenuItemIndex.toInt());
                                  },
                                  child: CustomItem(
                                    name:
                                        controller.sideMenuItems[index].title!,
                                    icon: controller.sideMenuItems[index].icon!,
                                    isActive: index ==
                                            controller.sideMenuItemIndex.value
                                        ? true
                                        : false,
                                  ),
                                );
                              },
                            ),
                        separatorBuilder: (context, index) => Container(
                              height: 1,
                              color: Colors.white54,
                              margin: EdgeInsets.all(size.height * .013),
                            ),
                        itemCount: 5),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(
                          thickness: 1,
                          color: Colors.white54,
                        ),
                        InkWell(
                          onTap: () async {
                            await CacheHelper.clearData();
                            Get.offAllNamed('startWindows');
                          },
                          child: Container(
                            width: size.width / 5,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Icon(
                                    Icons.logout,
                                    color: Colors.red,
                                    size: size.width * .02,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.015,
                                ),
                                CustomText(
                                  text: 'تسجيل الخروج',
                                  color: Colors.white,
                                  fontSize: size.width * .015,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
              flex: 2,
              child: Obx(() => controller
                  .sideMenuItems[controller.sideMenuItemIndex.value].screen!)),
        ],
      ),
    ));
  }
}

class CustomItem extends StatelessWidget {
  const CustomItem(
      {Key? key, this.isActive = false, required this.name, required this.icon})
      : super(key: key);
  final bool isActive;
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isActive ? AppConstants.lightPrimaryColor : Colors.transparent,
          boxShadow: [
            if (isActive)
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
              )
          ]),
      width: size.width / 6,
      padding: EdgeInsets.only(top: size.height * .012),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 9, right: size.width * .035),
            child: Icon(
              icon,
              color: Colors.white,
              size: size.width * .02,
            ),
          ),
          SizedBox(
            width: size.width * 0.015,
          ),
          CustomText(
            text: name,
            color: Colors.white,
            fontSize: size.width * .015,
          )
        ],
      ),
    );
  }
}
