import 'package:edu_lens/controllers/message_controller.dart';
import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/view/widget/custom_app_bar.dart';
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
      widget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Obx(
              ()=>CustomListView(
                itemCount: messageController.messageList.length,
                itemBuilder: (context, index) => buildMessageItem(index: index),
                axis: Axis.vertical,
                scroll: true,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMessageItem({index}) => Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppConstants.lightPrimaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  height: double.infinity,
                  width: 5,
                ),
                const SizedBox(
                  width: 7,
                ),
                const CircleAvatar(
                  backgroundColor: AppConstants.primaryColor,
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
                      Row(
                        children: [
                          CustomText(
                            text:
                                "${messageController.messageList[index].title}",
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.green,
                          ),
                        ],
                      ),
                        Text(
                        "${messageController.messageList[index].body}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
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
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );
}
