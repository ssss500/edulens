import 'package:edu_lens/controllers/message_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/widget/custom_app_bar.dart';
import 'package:edu_lens/view/widget/custom_image_url_view.dart';
import 'package:edu_lens/view/widget/custom_list_view.dart';
import 'package:edu_lens/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageView extends StatelessWidget {
  MessageView({Key? key}) : super(key: key);
  MessageController messageController = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: "messages title".tr,
      widget: Obx(
        () =>messageController.messageList.isEmpty &&
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
                  itemCount: messageController.messageList.length,
                  itemBuilder: (context, index) =>
                      buildMessageItem(index: index),
                  axis: Axis.vertical,
                  scroll: true,
                ),
              ),
      ),
    );
  }

  Widget buildMessageItem({index}) => Column(
        children: [
          Container(
            // height: 100,
            padding: const EdgeInsets.only(top: 15, right: 13, bottom: 15),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: AppConstants.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )),
            child: Column(
              children: [
                messageController.messageList[index].image == null
                    ? SizedBox()
                    : Container(
                        height: 200,
                        padding: const EdgeInsets.all(8),
                        child: CustomImageUrlView(
                          image:
                              "https://edu-lens.com/images/messages/${messageController.messageList[index].image}",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                Row(
                  children: [
                    Container(
                      constraints: const BoxConstraints(
                        minHeight: 100,
                      ),
                      decoration: BoxDecoration(
                          color: AppConstants.lightPrimaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      width: 5,
                      // height: ,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    const CircleAvatar(
                      backgroundColor: AppConstants.lightPrimaryColor,
                      radius: 25,
                      child: Icon(
                        Icons.message_outlined,
                        size: 25,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),

                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text:
                                "${messageController.messageList[index].title}",
                            color: Colors.white,
                            textAlign: TextAlign.end,
                            alignment: Alignment.centerRight,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "${messageController.messageList[index].body}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.all(8.0),
                    //   child: Text("12:00"),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );
}
