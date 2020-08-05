import 'package:dailyaww/models/reddit/reddit_images_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reddit_preview_model.g.dart';

@JsonSerializable()
class RedditPreviewModel {
  final List<RedditImagesModel> images;

  RedditPreviewModel({this.images});

  factory RedditPreviewModel.fromJson(Map<String, dynamic> json) =>
      _$RedditPreviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedditPreviewModelToJson(this);
}
