import 'package:edu_lens/view/widget/custom_app_bar.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyMessagesView extends StatelessWidget {
  const EmptyMessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: "messagesTitle".tr,
      widget: Center(
        child:  Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: Column(
            children:  [
              const Image(
                image: AssetImage("assets/images/mirage-no-comments.png"),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomText(
                text: "لا توجد لديك أي رسائل جديدة",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
