import 'package:json_annotation/json_annotation.dart';

part 'reddit_video_model.g.dart';

@JsonSerializable()
class RedditVideoModel {
  @JsonKey(name: 'fallback_url')
  final String url;
  final int width;
  final int height;
  @JsonKey(name: 'is_gif')
  final bool isGif;

  RedditVideoModel({this.url, this.width, this.height, this.isGif});

  factory RedditVideoModel.fromJson(Map<String, dynamic> json) =>
      _$RedditVideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedditVideoModelToJson(this);
}
