import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/widget/custom_floating_button.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final Widget? widget;
  final Widget? iconRight;
  final key;

  bool?   boolSearch, backgroundImageBool;
  final Function? functionFloatingButton, functionBake;
  final pageFloatingButton;
  final bool bakeButtonBool;
  final IconData iconFloatingButton;
  final bottomNavigationBar;
  Widget? floatingActionButton;

  CustomAppBar({
    required this.title,
    required this.widget,
    this.iconRight,
    this.key,
    this.functionBake,
    this.floatingActionButton,
    this.iconFloatingButton = Icons.add,
    // this.justButtonBool = false,
    this.bakeButtonBool = true,
    // this.floatingBool, //      required this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.boolSearch = false,
    this.backgroundImageBool = true,
    this.functionFloatingButton,
    this.pageFloatingButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: AppConstants.primaryColor,
      floatingActionButton:  floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          text: title.toString(),
          color: Colors.white,
          fontSize: 23,
          maxLines: 1,
        ),
        leading: bakeButtonBool
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white70,
                ),
                onPressed: () async {
                  try {
                    await functionBake!();
                  } catch (e) {
                    debugPrint(e.toString());
                  }

                  Get.back();
                },
              )
            : SizedBox(),
        actions: [
          Container(
            height: 50,
            width: 50,
            child: iconRight,
          )
//          iconRight
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: backgroundImageBool == true
                ? Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/backgroundHome.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 20,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                            topRight: Radius.elliptical(40, 40),
                            topLeft: Radius.elliptical(40, 40)),
                        color: Colors.white),
                    child: widget)
                : Container(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 20,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                            topRight: Radius.elliptical(40, 40),
                            topLeft: Radius.elliptical(40, 40)),
                        color: Colors.white),
                    child: widget),
          ),
        ],
      ),
    );
  }
}
