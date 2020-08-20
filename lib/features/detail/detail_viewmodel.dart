import 'dart:async';

import 'package:dailyaww/common/base_viewmodel.dart';
import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/services/content_service.dart';
import 'package:dailyaww/services/database_service.dart';
import 'package:dailyaww/services/localizations_service.dart';
import 'package:dailyaww/services/share_service.dart';
import 'package:dailyaww/shared/content_item.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetailViewModel extends BaseViewModel {
  ContentModel contentModel = ContentModel();
  VideoPlayerController controller;

  // inits the view mode, requireing the content view model
  DetailViewModel({@required this.contentModel});

  // holds the value to determine if the content was saved
  bool _isSaved = false;
  // stream controller handles the streaming of saved
  final _savedController = StreamController<bool>();
  // public facing stream that can be listened to for saved
  Stream<bool> get saved => _savedController.stream;

  // pulbic facing function to set if the view was saved
  void setSaved(value) {
    _isSaved = value;
    _savedController.add(_isSaved);
    // notifies any listeners
    notifyListeners();
  }

  /// will check if the content has been stored into the database,
  /// then updates the save state
  validateIfSaved() async {
    ContentService.isSaved(this.contentModel.content.id)
        .then((value) => setSaved(value != null));
  }

  /// Shares the content. Passes content data back to the
  /// share service.
  void share() {
    if (contentModel.content.isVideo)
      ShareService.share(
          contentModel.content.title, contentModel.content.videoUrl,
          isVideo: true);
    else
      ShareService.share(
          contentModel.content.title, contentModel.content.preview);
  }

  /// Handles bottom bar taps. Index used to determine which
  /// button was pressed
  void onBottomBarTap(int index) async {
    if (index == 0) {
      if (_isSaved) {
        //save content to favourites and validate its there
        await DatabaseService.deleteContent(contentModel.content.id)
            .then((value) => validateIfSaved());
      } else {
        //save content to favourites and validate its there
        await DatabaseService.insertContent(contentModel.content)
            .then((value) => validateIfSaved());
      }
    } else if (!contentModel.content.isVideo && index == 1)
      // shares the content
      share();
    else {
      setPopBackstack(true);
    }
  }

  /// Creates the bottom navigation bar
  BottomNavigationBar setBottomNavigation() {
    const share = BottomNavigationBarItem(
        icon: Icon(Icons.share), title: Text(Localize.share));

    const save = BottomNavigationBarItem(
        icon: Icon(Icons.favorite), title: Text(Localize.save));

    const unSaved = BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border), title: Text(Localize.save));

    const back = BottomNavigationBarItem(
        icon: Icon(Icons.arrow_back), title: Text(Localize.back));

    // currently sharing video isn't working. So its not displayed for
    // videos until I can figure out how to get it to correct transcribe
    // to IOS devices.
    if (contentModel.content.isVideo) {
      return setBottomBar(<BottomNavigationBarItem>[
        _isSaved ? save : unSaved,
        back,
      ], onBottomBarTap, currentIndex: 1);
    } else {
      return setBottomBar(<BottomNavigationBarItem>[
        _isSaved ? save : unSaved,
        share,
        back,
      ], onBottomBarTap, currentIndex: 2);
    }
  }

  /// Required to close any stream controller that has been opened
  void dispose() {
    super.dispose();
    _savedController.close();
  }
}
