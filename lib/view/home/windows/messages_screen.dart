import 'package:edu_lens/view/widget/custom_background.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/message_controller.dart';
import '../../../helper/app_constants.dart';
import '../../widget/custom_list_view.dart';
import '../../widget/message_card.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({Key? key}) : super(key: key);
  final MessageController messageController = Get.find();

  @override
  Widget build(BuildContext context) {
 messageController.getMessageApi();
 messageController.getMessage();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'الرسائل',
          color: AppConstants.lightPrimaryColor, fontSize: 24,fontWeight: FontWeight.bold,
        ),
        Obx(
          () => messageController.messageList.isEmpty &&
                  messageController.apiLoadingMessage.value
              ? const SizedBox(
                  height: 170,
                  child: Center(
                      child: CircularProgressIndicator(
                    color: AppConstants.lightPrimaryColor,
                  )))
              : messageController.messageList.isEmpty &&
                      messageController.apiLoadingMessage.value == false
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CustomText(
                            text: "لا توجد أي رسائل حتي الأن",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 20),
                          child: Image.asset(
                            'assets/images/no_content.png',
                            height: 300,
                            width: 300,
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 20),
                      child: CustomListView(
                        itemCount: messageController.messageList.length,
                        itemBuilder: (context, index) =>
                            MessageCard(index: index),
                        axis: Axis.vertical,
                        scroll: true,
                      ),
                    ),
        ),
      ],
    );
  }
}
