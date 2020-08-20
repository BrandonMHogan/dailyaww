import 'package:dailyaww/common/routes.dart';
import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/features/detail/detail_viewmodel.dart';
import 'package:dailyaww/services/image_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class DetailContent extends StatefulWidget {
  @override
  _DetailContentWidgetState createState() => _DetailContentWidgetState();
}

class _DetailContentWidgetState extends State<DetailContent> {
  @override
  void initState() {
    super.initState();

    var viewModel = Provider.of<DetailViewModel>(context, listen: false);

    // if the content is a video, then we need to stream the video
    // back to the video player and start it
    if (viewModel.contentModel.content.isVideo) {
      viewModel.controller = VideoPlayerController.network(
          viewModel.contentModel.content.videoUrl);
      viewModel.controller.setVolume(1.0);

      viewModel.controller
        ..initialize().then((_) {
          setState(() {
            viewModel.controller.play();
            viewModel.controller.setLooping(true);
          });
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.contentModel.content.isVideo) {
          return appScaffold(
              Center(
                child: viewModel.controller.value.initialized
                    ? AspectRatio(
                        aspectRatio: viewModel.controller.value?.aspectRatio,
                        child: VideoPlayer(viewModel.controller),
                      )
                    : Container(),
              ),
              actionButton: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    (viewModel.controller.value != null &&
                            viewModel.controller.value.isPlaying)
                        ? viewModel.controller.pause()
                        : viewModel.controller.play();
                  });
                },
                child: Icon(
                  (viewModel.controller.value != null &&
                          viewModel.controller.value.isPlaying)
                      ? Icons.pause
                      : Icons.play_arrow,
                ),
              ),
              hideAppBar: true,
              bottomNavigationBar: viewModel.setBottomNavigation());
        }

        // This is for images
        return appScaffold(
            GestureDetector(
              onTap: () {
                Routes.pop(context);
              },
              child: Center(
                child: Hero(
                  tag: viewModel.contentModel.content.id,
                  child: ImageService.cacheImage(
                      viewModel.contentModel.content.preview),
                ),
              ),
            ),
            hideAppBar: true,
            bottomNavigationBar: viewModel.setBottomNavigation());
      },
    );
  }
}
