import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:edu_lens/controllers/home/home_controllers.dart';
import 'package:edu_lens/controllers/message_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/home/mobile/profile_view.dart';
import 'package:edu_lens/view/message_view.dart';
import 'package:edu_lens/view/widget/custom_dialog/exit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'favourite_view.dart';
import 'home_view.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.dialog(ExitDialog());
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: AppConstants.primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Obx(
            () => Text(
              homeController.titleHome.toString(),
              style: const TextStyle(fontSize: 25),
            ),
          ),
          centerTitle: true,
          backgroundColor: AppConstants.primaryColor,
          elevation: 0,
          leading: Obx(
            () => AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                transitionBuilder: (child, anim) => RotationTransition(
                      turns: child.key == const ValueKey('icon1')
                          ? Tween<double>(begin: 1, end: 1).animate(anim)
                          : Tween<double>(begin: 0.75, end: 1).animate(anim),
                      child: ScaleTransition(scale: anim, child: child),
                    ),
                // ignore: unrelated_type_equality_checks
                child: homeController.pageIndex == 0
                    ? IconButton(
                        onPressed: () {
                          MessageController messageController=Get.put(MessageController());
                          messageController.getMessage();
                          Get.to(()=>MessageView());
                        },
                        icon: const Icon(Icons.mark_email_unread_rounded),
                        key: const ValueKey('icon1'),
                      )
                    : const Icon(null)),
          ),
        ),
        body: Container(
          color: AppConstants.primaryColor,
          child: Stack(
            children: [
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  // child: Container(
                  //
                  //   height: double.infinity,
                  //   width: MediaQuery.of(context).size.width,
                  //   color: Colors.white,
                  // ),
                  child: Image.asset(
                    "assets/images/backgroundHome.jpg",
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                bottomNavigationBar: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
                  child: SizedBox(
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Obx(
                        () => BottomBarInspiredFancy(
                          bottom: 5,
                          top: 14,
                          iconSize: 29,
                          items: AppConstants.itemsBottomBar,
                          backgroundColor: AppConstants.primaryColor,
                          color: const Color(0xFFf1fafd),
                          colorSelected: Colors.white,
                          indexSelected: homeController.pageIndex.value,
                          styleIconFooter: StyleIconFooter.dot,
                          onTap: (int index) async {
                            debugPrint(index.toString());
                            homeController.changePage(index);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                body: PageView(
                  controller: homeController.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    HomeViewMobile(),
                    Favourite(),
                    Profile(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
