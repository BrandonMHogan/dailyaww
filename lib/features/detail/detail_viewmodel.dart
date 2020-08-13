import 'package:dailyaww/common/base_viewmodel.dart';
import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/features/shared/content_viewmodel.dart';
import 'package:dailyaww/services/localizations_service.dart';
import 'package:dailyaww/services/share_service.dart';
import 'package:flutter/material.dart';

class DetailViewModel extends BaseViewModel {
  ContentViewModel content = ContentViewModel();

  // inits the view mode, requireing the content view model
  DetailViewModel({@required this.content});

  /// Shares the content. Passes content data back to the
  /// share service.
  void share() {
    if (content.isVideo)
      ShareService.share(content.title, content.videoUrl, isVideo: true);
    else
      ShareService.share(content.title, content.preview);
  }

  /// Handles bottom bar taps. Index used to determine which
  /// button was pressed
  void onBottomBarTap(int index) {
    if (index == 0) {
      //save content to favourites
    } else if (!content.isVideo && index == 1)
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
        icon: Icon(Icons.favorite_border), title: Text(Localize.save));

    const back = BottomNavigationBarItem(
        icon: Icon(Icons.arrow_back), title: Text(Localize.back));

    // currently sharing video isn't working. So its not displayed for
    // videos until I can figure out how to get it to correct transcribe
    // to IOS devices.
    if (content.isVideo) {
      return setBottomBar(const <BottomNavigationBarItem>[
        save,
        back,
      ], onBottomBarTap, currentIndex: 1);
    } else {
      return setBottomBar(const <BottomNavigationBarItem>[
        save,
        share,
        back,
      ], onBottomBarTap, currentIndex: 2);
    }
  }
}
