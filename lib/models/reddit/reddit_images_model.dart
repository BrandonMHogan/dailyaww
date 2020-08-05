import 'package:dailyaww/models/reddit/reddit_resolutions_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reddit_images_model.g.dart';

@JsonSerializable()
class RedditImagesModel {
  final RedditResolutionsModel source;
  final List<RedditResolutionsModel> resolutions;

  RedditImagesModel({this.source, this.resolutions});

  factory RedditImagesModel.fromJson(Map<String, dynamic> json) =>
      _$RedditImagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedditImagesModelToJson(this);
}
