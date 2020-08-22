import 'package:dailyaww/data/content.dart';
import 'package:flutter/foundation.dart';
import 'content_item.dart';

class ContentListModel with ChangeNotifier {
  /// current list of fresh content
  List<ContentModel> _content = List<ContentModel>();

  /// the getter for loading content
  List<ContentModel> get content => _content;

  /// Will set the content list, overriding the previous content
  void setContent(List<Content> value, {notify = false}) {
    _content = value.map((content) => ContentModel(content: content)).toList();
    if (notify) notifyListeners();
  }

  /// will add new items to the content list, removing duplicates
  void addToContentList(List<Content> value, {notify = false}) {
    value.forEach((content) {
      if (_content.where((c) => c.id == content.id).isEmpty) {
        addContent(ContentModel(content: content));
      }
    });
    if (notify) notifyListeners();
  }

  /// Adds a new item to the content
  void addContent(ContentModel value, {notify = false}) {
    if (!_content.contains(value)) {
      _content.add(value);
    }

    if (notify) {
      notifyListeners();
      value.notifyListeners();
    }
  }

  /// Removes an new item from the content list
  void removeContent(ContentModel value, {notify = false}) {
    _content.remove(value);
    if (notify) {
      notifyListeners();
      value.notifyListeners();
    }
  }

  void sort({notify = false}) {
    _content.sort((b, a) => a.created.compareTo(b.created));
    if (notify) notifyListeners();
  }

  // /// loads the content from the web service, converts it to a list
  // /// of content view models and returns it back to the listener
  // Future<void> _getContent(
  //     {String subreddit, String flavour, String limit}) async {
  //   List<Content> results = List<Content>();

  //   // loads content based on if its should be saved or new content
  //   await ContentService.getContent(saved: _showSaved)
  //       .then((value) => results.addAll(value));

  //   // maps the results to the content view model list
  //   // only adds the new result to content if the exact id doesnt
  //   // already exist
  //   results.forEach((result) {
  //     var contains = _content.where((c) => c.id == result.id);
  //     if (contains.isEmpty) {
  //       addContent(ContentModel(content: result), toSaved: _showSaved);
  //     }
  //   });

  //   sort(notify: true);
  // }
}
