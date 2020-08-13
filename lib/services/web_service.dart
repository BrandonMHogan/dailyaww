import 'dart:async';
import 'dart:convert';
import 'package:dailyaww/models/content.dart';
import 'package:dailyaww/models/reddit/reddit_model.dart';
import 'package:http/http.dart';

class WebService {
  // base reddit url for loading content from reddit
  static const String redditBase = 'https://www.reddit.com/r/';
  // aww subreddit. The primary content comes from here
  static const String redditAww = 'aww/';

  /// flavour used to determine the order of content returned
  static const String flavourNew = 'new';
  static const String flavourTop = 'top';

  /// public facing future that returns all content from all sources
  Future<List<Content>> getContent() {
    return _getRedditData();
  }

  /// Loads data from Reddit. Converts the data to a list
  /// of Content for the view to consume
  Future<List<Content>> _getRedditData(
      {String subreddit = redditAww,
      flavour = flavourNew,
      String limit = "50"}) async {
    String url =
        redditBase + subreddit + flavour + '.json?raw_json=1&limit=' + limit;
    Response response = await get(url);
    String json = response.body;

    RedditModel model = RedditModel.fromJson(jsonDecode(json));

    // strips out any children that have a null preview.
    model.data.children.removeWhere((child) => child.data.preview == null);

    // strips out any child that is very tiny, as they wont look good in the list view
    model.data.children.removeWhere(
        (child) => child.data.preview.images[0].source.width <= 900);

    //TODO: Testing only. Forces only video types back to the listener
    //model.data.children.removeWhere((child) => child.data.media == null);

    List<Content> contentList = List<Content>();
    // loops through the reddit items and converts them to content items
    model.data.children.forEach((item) {
      contentList.add(Content(
        item.data.id,
        item.data.title,
        item.data.preview.images[0].source.url,
        item.data.preview.images[0].source.width,
        item.data.preview.images[0].source.height,
        item.data.created.round(),
        isVideo: item.data.media?.video?.url != null,
        isGif: item.data.media?.video?.isGif ?? false,
        videoUrl: item.data.media?.video?.url,
        videoHeight: item.data.media?.video?.height,
        videoWidth: item.data.media?.video?.width,
      ));
    });

    return contentList;
  }
}
