import 'package:json_annotation/json_annotation.dart';

import 'reddit_video_model.dart';

part 'reddit_media_model.g.dart';

@JsonSerializable()
class RedditMediaModel {
  @JsonKey(name: 'reddit_video')
  final RedditVideoModel video;

  RedditMediaModel({this.video});

  factory RedditMediaModel.fromJson(Map<String, dynamic> json) =>
      _$RedditMediaModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedditMediaModelToJson(this);
}
