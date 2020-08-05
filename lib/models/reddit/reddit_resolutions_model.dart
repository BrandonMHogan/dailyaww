import 'package:json_annotation/json_annotation.dart';

part 'reddit_resolutions_model.g.dart';

@JsonSerializable()
class RedditResolutionsModel {
  final String url;
  final int width;
  final int height;

  RedditResolutionsModel({this.url, this.width, this.height});

  factory RedditResolutionsModel.fromJson(Map<String, dynamic> json) =>
      _$RedditResolutionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedditResolutionsModelToJson(this);
}
