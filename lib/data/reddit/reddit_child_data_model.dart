import 'package:dailyaww/data/reddit/reddit_preview_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'reddit_media_model.dart';

part 'reddit_child_data_model.g.dart';

@JsonSerializable()
class RedditChildDataModel {
  final String id;
  final String title;
  final double created;
  final RedditPreviewModel preview;
  @JsonKey(name: 'secure_media')
  final RedditMediaModel media;

  RedditChildDataModel(
      {this.id, this.title, this.created, this.preview, this.media});

  factory RedditChildDataModel.fromJson(Map<String, dynamic> json) =>
      _$RedditChildDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedditChildDataModelToJson(this);
}
