import 'package:dailyaww/services/content_service.dart';
import 'package:dailyaww/shared/content_item.dart';
import 'package:dailyaww/shared/fresh_list_content.dart';
import 'package:dailyaww/shared/saved_list_content.dart';
import 'package:flutter/foundation.dart';

/// State enum to represent what type of data is being displayed
/// to the user
enum DisplayState { fresh, saved }

class ContentState extends ChangeNotifier {
  final String name = 'Change Me';

  final SavedListContent saved;
  final FreshListContent fresh;

  /// Keeps track of which list of content is currently being displayed
  DisplayState _displayState = DisplayState.fresh;
  DisplayState get displayState => _displayState;

  ContentState()
      : saved = SavedListContent(),
        fresh = FreshListContent() {
    _populateSavedContent();
    _populateFreshContent();
  }

  @override
  String toString() => name;

  /// Will look to the database, and pull out any saved content items,
  /// fully replacing the save content stored.
  Future<void> _populateSavedContent({notify = false}) async {
    saved.setContent(await ContentService.getContent(saved: true),
        notify: notify);
  }

  /// Will do a api call for fresh data, and replace the existing list
  /// of content in the fresh list
  Future<void> _populateFreshContent({notify = false}) async {
    fresh.setContent(await ContentService.getContent(saved: false),
        notify: notify);
  }

  /// Helper function to see if the content model has been saved or not
  bool isContentSaved(ContentModel contentModel) {
    return saved.content.contains(contentModel);
  }

  /// Will update the display state, notifing any screen that might
  /// need to change its content
  showSaved() => _setState(DisplayState.saved);
  showFresh() => _setState(DisplayState.fresh);
  refresh() {
    if (_displayState == DisplayState.fresh) {
      _populateFreshContent(notify: true);
    } else {
      _populateSavedContent(notify: true);
    }
  }

  /// Directly sets the state based on passed in type and notifies
  /// the listener
  _setState(DisplayState state) {
    _displayState = state;
    notifyListeners();
  }
}
