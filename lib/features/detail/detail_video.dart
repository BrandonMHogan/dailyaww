import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

Widget detailVideo(contentModel, controller) {
  return controller.value.initialized
      ? AspectRatio(
          aspectRatio: controller.value?.aspectRatio,
          child: VideoPlayer(controller),
        )
      : Container();

  //       actionButton: FloatingActionButton(
  //   onPressed: () {
  //     context.setState(() {
  //       (controller.value != null &&
  //               controller.value.isPlaying)
  //           ? controller.pause()
  //           : controller.play();
  //     });
  //   },
  //   child: Icon(
  //     (controller.value != null &&
  //             controller.value.isPlaying)
  //         ? Icons.pause
  //         : Icons.play_arrow,
  //   ),
  // ),
}
