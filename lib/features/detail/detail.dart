import 'package:dailyaww/common/routes/routes.dart';
import 'package:dailyaww/common/styles/theme.dart';
import 'package:dailyaww/features/detail/detail_footer.dart';
import 'package:dailyaww/features/detail/detail_image.dart';
import 'package:dailyaww/features/detail/detail_video.dart';
import 'package:dailyaww/services/database_service.dart';
import 'package:dailyaww/services/image_service.dart';
import 'package:dailyaww/services/localizations_service.dart';
import 'package:dailyaww/services/share_service.dart';
import 'package:dailyaww/shared/content_item.dart';
import 'package:dailyaww/shared/content_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class DetailWidget extends StatefulWidget {
  final ContentModel contentModel;

  DetailWidget({@required this.contentModel});

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  VideoPlayerController videoController;

  @override
  void initState() {
    var contentState = Provider.of<ContentState>(context, listen: false);

    if (widget.contentModel.isVideo) {
      // will set the video controller and play it
      videoController =
          VideoPlayerController.network(widget.contentModel.content.videoUrl);
      videoController.setVolume(1.0);

      videoController
        ..initialize().then((_) {
          setState(() {
            videoController.play();
            videoController.setLooping(true);
          });
        });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          onTap: () {
            Routes.pop(context);
          },
          child: Center(
            child: widget.contentModel.content.isVideo
                ? detailVideo(widget.contentModel, videoController)
                : detailImage(widget.contentModel),
          ),
        ),
        bottomNavigationBar: ChangeNotifierProvider<ContentModel>.value(
          value: widget.contentModel,
          child: DetailFooter(),
        ));
  }
}
