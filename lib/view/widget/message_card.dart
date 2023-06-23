import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/message_controller.dart';
import '../../helper/app_constants.dart';
import 'custom_image_url_view.dart';
import 'custom_text.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    MessageController messageController = Get.find();
    double width = MediaQuery.of(context).size.width;
    if (width >= 800) {
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppConstants.primaryColor,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      constraints: const BoxConstraints(
                        minHeight: 150,
                      ),
                      decoration: BoxDecoration(
                          color: AppConstants.lightPrimaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      width: 100,
                      child: const CircleAvatar(
                        backgroundColor: AppConstants.lightPrimaryColor,
                        radius: 25,
                        child: Icon(
                          Icons.message_outlined,
                          size: 25,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      flex: 2,
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
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    if (messageController.messageList[index]!.image != null)
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 150,
                          padding: const EdgeInsets.all(8),
                          child: CustomImageUrlView(
                            image:
                                "https://edu-lens.com/images/messages/${messageController.messageList[index].image}",
                            height: 150.0,
                            width: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
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
                    ? const SizedBox()
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
                            style:const TextStyle(color: Colors.white, fontSize: 14),
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
  }
}
