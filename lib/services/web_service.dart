import 'dart:convert';
import 'package:dailyaww/models/content.dart';
import 'package:dailyaww/models/reddit/reddit_model.dart';
import 'package:http/http.dart';

class WebService {
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

    // strips out any child that is very tiny, as they wont look good in the list view
    model.data.children.removeWhere(
        (child) => child.data.preview.images[0].source.width <= 1000);

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
