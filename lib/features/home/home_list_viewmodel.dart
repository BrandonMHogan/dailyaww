import 'package:dailyaww/common/base_viewmodel.dart';
import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/features/shared/content_viewmodel.dart';
import 'package:dailyaww/models/content.dart';
import 'package:dailyaww/services/localizations_service.dart';
import 'package:dailyaww/services/web_service.dart';
import 'package:flutter/material.dart';

class HomeListViewModel extends BaseViewModel {
  List<ContentViewModel> content = List<ContentViewModel>();

  bool isRefresh = false;

  /// loads the content from the web service, converts it to a list
  /// of content view models and returns it back to the listener
  Future<void> _getContent(
      {String subreddit, String flavour, String limit}) async {
    List<Content> results = List<Content>();
    WebService loader = new WebService();
    // awaits for the reddit data to come back and adds it to the content list
    await loader.getContent().then((value) => results.addAll(value));

    // maps the results to the content view model list
    // only adds the new result to content if the exact id doesnt
    // already exist
    results.forEach((result) {
      var contains = content.where((c) => c.id == result.id);
      if (contains.isEmpty) {
        content.add(ContentViewModel(content: result));
      }
    });

    content.sort((b, a) => a.created.compareTo(b.created));
    // notifies any listeners
    notifyListeners();
    // clears the refresh stream
    setRefresh(false);
  }

  @override
  void setRefresh(value) {
    isRefresh = value;
    super.setRefresh(value);
    // if true, will load fresh content
    if (value) _getContent();
    //notifyListeners();
  }

  /// Handles bottom bar taps. Index used to determine which
  /// button was pressed
  void onBottomBarTap(int index) {
    if (index == 0) {
      //navigate to settings
    } else {
      setRefresh(true);
    }
  }

  /// Creates the bottom navigation bar
  BottomNavigationBar setBottomNavigation() {
    const refresh = BottomNavigationBarItem(
        icon: Icon(Icons.refresh), title: Text(Localize.refresh));

    const settings = BottomNavigationBarItem(
        icon: Icon(Icons.settings), title: Text(Localize.settings));

    return setBottomBar(const <BottomNavigationBarItem>[
      settings,
      refresh,
    ], onBottomBarTap);
  }
}
