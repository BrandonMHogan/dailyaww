import 'package:dailyaww/common/base_viewmodel.dart';
import 'package:dailyaww/common/routes.dart';
import 'package:dailyaww/common/theme.dart';
import 'package:dailyaww/features/shared/content_viewmodel.dart';
import 'package:dailyaww/models/content.dart';
import 'package:dailyaww/services/content_service.dart';
import 'package:dailyaww/services/localizations_service.dart';
import 'package:flutter/material.dart';

class ContentListViewModel extends BaseViewModel {
  /// Constructor for the list view model
  ContentListViewModel();

  /// determins if we are showing saved or fresh content
  bool _showSaved = false;
  // list of content to be displayed in the list
  List<ContentViewModel> content = List<ContentViewModel>();

  /// Stores the scroll controller reference in the view model
  /// so that it can stay persistent between rebuilds, and can be
  /// directly accessed in the view model
  ScrollController _scrollController;

  /// public getter for the scroll controller. Will create it if it
  /// doesn't already exist
  ScrollController getScrollController() {
    if (_scrollController == null) {
      _scrollController = new ScrollController();
    }
    return _scrollController;
  }

  /// loads the content from the web service, converts it to a list
  /// of content view models and returns it back to the listener
  Future<void> _getContent(
      {String subreddit, String flavour, String limit}) async {
    List<Content> results = List<Content>();

    // loads content based on if its should be saved or new content
    await ContentService.getContent(saved: _showSaved)
        .then((value) => results.addAll(value));

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
    super.setRefresh(value);
    // if true, will load fresh content and scroll to the top
    if (value) {
      // if we are refreshing the saved, then clear content first
      if (_showSaved) clear();
      _getContent();
      _scrollController?.animateTo(0.0,
          duration: const Duration(milliseconds: 1000), curve: Curves.easeOut);
    }
  }

  /// will clear the content, so it is empty
  clear() {
    content = List<ContentViewModel>();
    // notifies any listeners
    notifyListeners();
  }

  /// toggles between showing saved or new content.
  /// will only refresh the content if the passed value is different then
  /// the existing value
  showSavedContent(value) {
    if (_showSaved != value) {
      _showSaved = value;
      clear();
      setRefresh(true);
      //notifyListeners();
    }
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
