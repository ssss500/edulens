import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlay extends StatefulWidget {
  String? pathh;

  @override
  _VideoPlayState createState() => _VideoPlayState();

  VideoPlay({
    Key? key,
    this.pathh, // Video from assets folder
  }) : super(key: key);
}

class _VideoPlayState extends State<VideoPlay> {
  ValueNotifier<VideoPlayerValue?> currentPosition = ValueNotifier(null);
  VideoPlayerController? controller;
  late Future<void> futureController;

  initVideo() {
    controller = VideoPlayerController.network(widget.pathh!);

    futureController = controller!.initialize();
  }

  @override
  void initState() {
    initVideo();
    controller!.addListener(() {
      if (controller!.value.isInitialized) {
        currentPosition.value = controller!.value;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureController,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
              height: double.infinity,
              child: CircularProgressIndicator.adaptive());
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: controller!.value.size.height,
              width: double.infinity,
              child: AspectRatio(
                  aspectRatio: controller!.value.aspectRatio,
                  child: Stack(children: [
                    Positioned.fill(
                        child: Container(
                            foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(.7),
                                    Colors.transparent
                                  ],
                                  stops: [
                                    0,
                                    .3
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter),
                            ),
                            child: VideoPlayer(controller!))),
                    Positioned.fill(
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 10,
                              width: 10,
                              margin: EdgeInsets.all(70),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.black87,
                              ),
                              child: IconButton(
                                icon: Icon(
                                  controller!.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (controller!.value.isPlaying) {
                                      controller!.pause();
                                    } else {
                                      controller!.play();
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ValueListenableBuilder(
                                valueListenable: currentPosition,
                                builder: (context,
                                    VideoPlayerValue? videoPlayerValue, w) {
                                  return Row(
                                    children: [
                                      Text(
                                        videoPlayerValue!.position
                                            .toString()
                                            .substring(
                                                videoPlayerValue.position
                                                        .toString()
                                                        .indexOf(':') +
                                                    1,
                                                videoPlayerValue.position
                                                    .toString()
                                                    .indexOf('.')),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 22),
                                      ),
                                      const Spacer(),
                                      Text(
                                        videoPlayerValue.duration
                                            .toString()
                                            .substring(
                                                videoPlayerValue.duration
                                                        .toString()
                                                        .indexOf(':') +
                                                    1,
                                                videoPlayerValue.duration
                                                    .toString()
                                                    .indexOf('.')),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 22),
                                      ),
                                    ],
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ])),
            ),
          );
        }
      },
    );
  }
}
