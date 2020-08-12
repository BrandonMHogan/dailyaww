import 'package:dailyaww/common/routes.dart';
import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/features/shared/content_viewmodel.dart';
import 'package:dailyaww/services/localizations_service.dart';
import 'package:dailyaww/services/share_service.dart';
import 'package:dailyaww/services/image_service.dart';
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

  void _onBottomBarTap(int index) async {
    if (widget.content.isVideo && index == 1)
      Routes.pop(context);
    // else if (!widget.content.isVideo && index == 2)
    //   Routes.pop(context);
    else if (index == 0) {
      if (widget.content.isVideo)
        ShareService.share(widget.content.title, widget.content.videoUrl,
            isVideo: true);
      else
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
    const share = BottomNavigationBarItem(
        icon: Icon(Icons.share), title: Text(Localize.share));

    const save = BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border), title: Text(Localize.save));

    const back = BottomNavigationBarItem(
        icon: Icon(Icons.arrow_back), title: Text(Localize.back));

    if (widget.content.isVideo) {
      return setBottomBar(const <BottomNavigationBarItem>[
        share,
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
        bottomNavigationBar: setBottomNavigation());
  }
}
