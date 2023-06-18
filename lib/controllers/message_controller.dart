import 'package:edu_lens/helper/app_constants.dart';
import 'package:edu_lens/helper/cashe_helper.dart';
import 'package:edu_lens/helper/dio_integration.dart';
import 'package:edu_lens/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  final messageList = [].obs;
  final dio = DioUtilNew.dio;
  late RxBool apiLoadingMessage = false.obs;



   getMessage()  async {
    debugPrint("getMessage");
    messageList.value =   (await getMessageApi()!) ??[];
  }

   getMessageApi() async {
     apiLoadingMessage.value = true;

     try {
      final response = await dio!.post(AppConstants.message, queryParameters: {
        "student_class_id": CacheHelper.getData(
          key: AppConstants.studentClassId,
        )
      }, data: {
        "api_developer": "EdUK3fbVl96SVBJQ5U2HxU5rLens"
      });

      debugPrint("response.statusCode : ${response.statusCode.toString()}");
      debugPrint("response.data : ${response.data}");
      if (response.statusCode == 200) {
        final mList = List<MessageModel>.from(
            response.data.map((i) => MessageModel.fromJson(i)));
        apiLoadingMessage.value = false;

        return mList;
      }
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('failed');

     }
     apiLoadingMessage.value = false;

     return null;
  }
}
