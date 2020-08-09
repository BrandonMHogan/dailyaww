import 'package:dailyaww/common/routes.dart';
import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/features/shared/content_viewmodel.dart';
import 'package:dailyaww/services/share_service.dart';
import 'package:dailyaww/services/image_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';

class DetailWidget extends StatefulWidget {
  final ContentViewModel content;

  DetailWidget({@required this.content});

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  VideoPlayerController _controller;

  void _onBottomBarTap(int index) async {
    if (widget.content.isVideo && index == 1)
      Routes.pop(context);
    else if (!widget.content.isVideo && index == 2)
      Routes.pop(context);
    else if (!widget.content.isVideo && index == 0) {
      ShareService.share(widget.content.title, widget.content.preview);
    }
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

  BottomNavigationBar setBottomNavigation() {
    const share =
        BottomNavigationBarItem(icon: Icon(Icons.share), title: Text("Share"));

    const save = BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border), title: Text("Save"));

    const back = BottomNavigationBarItem(
        icon: Icon(Icons.arrow_back), title: Text("Back"));

    if (widget.content.isVideo) {
      return setBottomBar(const <BottomNavigationBarItem>[
        save,
        back,
      ], _onBottomBarTap, currentIndex: 1);
    } else {
      return setBottomBar(const <BottomNavigationBarItem>[
        share,
        save,
        back,
      ], _onBottomBarTap, currentIndex: 2);
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
          bottomNavigationBar: setBottomNavigation());
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
              child: ImageService.cacheImage(widget.content.preview),
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
