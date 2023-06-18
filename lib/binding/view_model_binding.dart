import 'package:edu_lens/controllers/login/register_controller.dart';
import 'package:get/get.dart';

import '../controllers/message_controller.dart';


class ViewModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController(), fenix: true);
    Get.lazyPut<MessageController>(() => MessageController(), fenix: true);
  }
}
