import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/services/database_service.dart';
import 'package:dailyaww/services/localizations_service.dart';
import 'package:dailyaww/services/share_service.dart';
import 'package:dailyaww/shared/content_item.dart';
import 'package:dailyaww/shared/content_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailFooter extends StatefulWidget {
  final bool isVideo;

  const DetailFooter({this.isVideo = false});

  static const share = BottomNavigationBarItem(
      icon: Icon(Icons.share), title: Text(Localize.share));

  static const save = BottomNavigationBarItem(
      icon: Icon(Icons.favorite), title: Text(Localize.save));

  static const unSaved = BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border), title: Text(Localize.save));

  static const back = BottomNavigationBarItem(
      icon: Icon(Icons.arrow_back), title: Text(Localize.back));

  @override
  _DetailFooterState createState() => _DetailFooterState();
}

class _DetailFooterState extends State<DetailFooter> {
  ContentState contentState;
  ContentModel contentModel;
  var isSaved;

  /// Handles bottom bar taps. Index used to determine which
  /// button was pressed
  void onBottomBarTap(int index) async {
    if (index == 0) {
      if (isSaved) {
        //save content to favourites and validate its there
        await DatabaseService.deleteContent(contentModel).then((value) => {
              if (value != null && value > 0)
                {contentState.saved.removeContent(contentModel, notify: true)}
            });
      } else {
        //save content to favourites and validate its there
        await DatabaseService.insertContent(contentModel).then((value) => {
              if (value != null && value > 0)
                {contentState.saved.addContent(contentModel, notify: true)}
            });
      }
    } else if (!contentModel.content.isVideo && index == 1)
      // shares the content
      share();
    else {
      Navigator.pop(context);
    }
  }

  /// Shares the content. Passes content data back to the
  /// share service.
  void share() {
    if (widget.isVideo)
      ShareService.share(
          contentModel.content.title, contentModel.content.videoUrl,
          isVideo: true);
    else
      ShareService.share(
          contentModel.content.title, contentModel.content.preview);
  }

  @override
  Widget build(BuildContext context) {
    contentState = Provider.of<ContentState>(context);
    contentModel = Provider.of<ContentModel>(context);
    isSaved = contentState.isContentSaved(contentModel);

    if (widget.isVideo) {
      return setBottomBar(<BottomNavigationBarItem>[
        isSaved ? DetailFooter.save : DetailFooter.unSaved,
        DetailFooter.back,
      ], onBottomBarTap, currentIndex: 1);
    } else {
      return setBottomBar(<BottomNavigationBarItem>[
        isSaved ? DetailFooter.save : DetailFooter.unSaved,
        DetailFooter.share,
        DetailFooter.back,
      ], onBottomBarTap, currentIndex: 2);
    }
  }
}
