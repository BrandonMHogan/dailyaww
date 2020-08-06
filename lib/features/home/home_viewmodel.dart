import 'package:dailyaww/features/shared/content_viewmodel.dart';
import 'package:dailyaww/models/content.dart';
import 'package:dailyaww/services/content_loader.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  List<ContentViewModel> content = List<ContentViewModel>();

  Future<void> fetchReddit(
      {String subreddit, String flavour, String limit}) async {
    List<Content> results = List<Content>();
    ContentLoader loader = new ContentLoader();
    // awaits for the reddit data to come back and adds it to the content list
    await loader.getRedditData().then((value) => results.addAll(value));

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
  }

  /// Refreshes all data loading
  void refresh({force = true}) {
    fetchReddit();
  }

  void add(ContentViewModel contentModel) {
    content.add(contentModel);
    notifyListeners();
  }
}
