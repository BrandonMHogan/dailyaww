import 'package:dailyaww/models/reddit/reddit_preview_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reddit_child_data_model.g.dart';

@JsonSerializable()
class RedditChildDataModel {
  final String id;
  final String title;
  final double created;
  final RedditPreviewModel preview;

  RedditChildDataModel({this.id, this.title, this.created, this.preview});

  factory RedditChildDataModel.fromJson(Map<String, dynamic> json) =>
      _$RedditChildDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedditChildDataModelToJson(this);
}
