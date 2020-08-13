import 'package:dailyaww/common/routes.dart';
import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/features/detail/detail_viewmodel.dart';
import 'package:dailyaww/services/image_service.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetailWidget extends StatefulWidget {
  final DetailViewModel viewModel;

  DetailWidget({@required this.viewModel});

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    widget.viewModel.popBackstack.listen((event) {
      if (event) Routes.pop(context);
    });

    // if the content is a video, then we need to stream the video
    // back to the video player and start it
    if (widget.viewModel.content.isVideo) {
      _controller =
          VideoPlayerController.network(widget.viewModel.content.videoUrl);
      _controller.setVolume(1.0);

      _controller
        ..initialize().then((_) {
          setState(() {
            _controller.play();
            _controller.setLooping(true);
          });
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.viewModel.content.isVideo) {
      return appScaffold(
          Center(
            child: _controller.value.initialized
                ? AspectRatio(
                    aspectRatio: _controller.value?.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
          ),
          actionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                (_controller.value != null && _controller.value.isPlaying)
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: Icon(
              (_controller.value != null && _controller.value.isPlaying)
                  ? Icons.pause
                  : Icons.play_arrow,
            ),
          ),
          hideAppBar: true,
          bottomNavigationBar: widget.viewModel.setBottomNavigation());
    }

    // This is for images
    return appScaffold(
        GestureDetector(
          onTap: () {
            Routes.pop(context);
          },
          child: Center(
            child: Hero(
              tag: widget.viewModel.content.id,
              child: ImageService.cacheImage(widget.viewModel.content.preview),
            ),
          ),
        ),
        hideAppBar: true,
        bottomNavigationBar: widget.viewModel.setBottomNavigation());
  }
}
