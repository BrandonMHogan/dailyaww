import 'dart:convert';
import 'package:dailyaww/models/content.dart';
import 'package:dailyaww/models/reddit/reddit_model.dart';
import 'package:http/http.dart';

class ContentLoader {
  Future<List<Content>> getRedditData(
      {String subreddit = "aww", flavour = "new", String limit = "50"}) async {
    String url = 'https://www.reddit.com/r/' +
        subreddit +
        '/' +
        flavour +
        '.json?raw_json=1&limit=' +
        limit;
    Response response = await get(url);
    String json = response.body;

    RedditModel model = RedditModel.fromJson(jsonDecode(json));

    // strips out any children that have a null preview.
    model.data.children.removeWhere((child) => child.data.preview == null);

    List<Content> contentList = List<Content>();
    // loops through the reddit items and converts them to content items
    model.data.children.forEach((item) {
      contentList.add(Content(
          item.data.id,
          item.data.title,
          item.data.preview.images[0].source.url,
          item.data.preview.images[0].source.width,
          item.data.preview.images[0].source.height,
          item.data.created.round()));
    });

    return contentList;
  }
}
