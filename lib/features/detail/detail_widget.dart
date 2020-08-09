import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailyaww/common/routes.dart';
import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/features/shared/content_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetailWidget extends StatefulWidget {
  final ContentViewModel content;

  DetailWidget({@required this.content});

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  VideoPlayerController _controller;

  void _onBottomBarTap(int index) {
    setState(() {
      if (index == 2) Routes.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.content.isVideo) {
      _controller = VideoPlayerController.network(widget.content.videoUrl);
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
    if (widget.content.isVideo) {
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
          bottomNavigationBar: setBottomBar(const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.share), title: Text("Share")),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), title: Text("Save")),
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back), title: Text("Back")),
          ], _onBottomBarTap, currentIndex: 2));
    }

    // This is for images
    return appScaffold(
        GestureDetector(
          onTap: () {
            Routes.pop(context);
          },
          child: Center(
            child: Hero(
              tag: widget.content.id,
              child: CachedNetworkImage(
                imageUrl: widget.content.preview,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        ),
        hideAppBar: true,
        bottomNavigationBar: setBottomBar(const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.share), title: Text("Share")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), title: Text("Save")),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back), title: Text("Back")),
        ], _onBottomBarTap, currentIndex: 2));
  }
}
