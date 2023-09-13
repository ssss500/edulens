import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/video_controller.dart';
import '../../../responsive.dart';
import '../video_view.dart';
import '../video_view_windows.dart';

class VideoViewCommon extends GetView<VideoController> {
  const VideoViewCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Get.put(VideoController());
    return Responsive(mobile: VideoView(), desktop:   VideoViewWindows());
  }
}
