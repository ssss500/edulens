import 'package:edu_lens/controllers/message_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/widget/message_card.dart';
import 'package:edu_lens/view/widget/custom_app_bar.dart';
import 'package:edu_lens/view/widget/custom_list_view.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageView extends GetView<MessageController> {
  const MessageView({Key? key}) : super(key: key);
 // MessageController messageController = Get.find();

  @override
  Widget build(BuildContext context) {

    return CustomAppBar(
      title: "messagesTitle".tr,
      widget: Obx(
        () =>controller.messageList.isEmpty &&
            controller.apiLoadingMessage.value
            ? const SizedBox(
            height: 170,
            child: Center(
                child: CircularProgressIndicator(
                  color: AppConstants.lightPrimaryColor,
                )))
            : controller.messageList.isEmpty &&
            controller.apiLoadingMessage.value == false
            ?
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                'assets/images/mirage-no-comments.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomText(
                text:
                "لا يوجد بيانات",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        )
            :  Padding(
                padding: const EdgeInsets.only(left: 15, right: 15,top: 20),
                child: CustomListView(
                  itemCount: controller.messageList.length,
                  itemBuilder: (context, index) =>
                      MessageCard(index: index),
                  axis: Axis.vertical,
                  scroll: true,
                ),
              ),
      ),
    );
  }

}
