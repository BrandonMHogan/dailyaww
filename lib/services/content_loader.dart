import 'dart:convert';
import 'package:dailyaww/models/reddit/reddit_child_model.dart';
import 'package:dailyaww/models/reddit/reddit_model.dart';
import 'package:http/http.dart';

class ContentLoader {
  Future<List<RedditChildModel>> getRedditData(
      {String subreddit = "aww", flavour = "new", String limit = "20"}) async {
    String url = 'https://www.reddit.com/r/' +
        subreddit +
        '/' +
        flavour +
        '.json?raw_json=1&limit=' +
        limit;
    Response response = await get(url);
    String json = response.body;

    RedditModel model = RedditModel.fromJson(jsonDecode(json));
    return model.data.children;
  }
}
