import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/widget/custom_background.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/cashe_helper.dart';
import '../../../routes/routes_names.dart';

class HomeMenuScreenWindows extends GetView<HomeController> {
  const HomeMenuScreenWindows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //controller.services.getDataUser();
    final size = MediaQuery.of(context).size;
    debugPrint(' hello ${controller.studentProfile.toString()}');
    return Scaffold(
      body: CustomBackground(
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
                          Obx(() => controller.studentProfile.isEmpty
                              ? const SizedBox(
                                  height: 40,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: AppConstants.lightPrimaryColor,
                                  )))
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text:
                                          '${controller.studentProfile[0].firstName} ${controller.studentProfile[0].lastName}',
                                      fontSize: size.width * .016,
                                      fontWeight: FontWeight.bold,
                                      color: AppConstants.lightPrimaryColor,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.012,
                                    ),
                                    CustomText(
                                      text:
                                          '${controller.listYears[int.parse(controller.studentProfile[0].studentClassId.toString()) - 1].name}',
                                      fontSize: size.width * .014,
                                      color: Colors.white,
                                    ),
                                  ],
                                )),
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
                          Obx(
                            () => controller.studentProfile.isEmpty
                                ? const SizedBox(
                                    height: 40,
                                    child: Center(
                                        child: CircularProgressIndicator(
                                      color: AppConstants.lightPrimaryColor,
                                    )))
                                : CustomText(
                                    text:
                                        "${controller.studentProfile[0].phone}"
                                    //  "${controller.studentProfile[0].phone}"
                                    ,
                                    color: Colors.white),
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
                          CustomText(
                            text: 'رقم ولي الأمر:',
                            color: Colors.white,
                          ),
                          Obx(
                            () => controller.studentProfile.isEmpty
                                ? const SizedBox(
                                    height: 40,
                                    child: Center(
                                        child: CircularProgressIndicator(
                                      color: AppConstants.lightPrimaryColor,
                                    )))
                                : CustomText(
                                    text:
                                        '${controller.studentProfile[0].parentPhone}',
                                    color: Colors.white),
                          )
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
                          Obx(
                            () => controller.studentProfile.isEmpty
                                ? const SizedBox(
                                    height: 40,
                                    child: Center(
                                        child: CircularProgressIndicator(
                                      color: AppConstants.lightPrimaryColor,
                                    )))
                                : CustomText(
                                    text:
                                        '${controller.studentProfile[0].bucket} ج.م.',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * .012,
                                  ),
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
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) => Obx(
                                  () {
                                    return InkWell(
                                      onTap: () {
                                        controller.sideMenuItemIndex.value =
                                            index;
                                        // if (index == 2) {}
                                        print(controller.sideMenuItemIndex
                                            .toInt());
                                      },
                                      child: CustomItem(
                                        name: controller
                                            .sideMenuItems[index].title!,
                                        icon: controller
                                            .sideMenuItems[index].icon!,
                                        isActive: index ==
                                                controller
                                                    .sideMenuItemIndex.value
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
                            itemCount: controller.sideMenuItems.length),
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
                                Get.offAllNamed(RoutesNames.welcomeScreen);
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
                  flex: 3,
                  child: Obx(() => controller
                      .sideMenuItems[controller.sideMenuItemIndex.value]
                      .screen!)),
            ],
          ),
        ),
      ),
    );
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
