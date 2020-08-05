import 'package:dailyaww/models/reddit/reddit_preview_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reddit_child_data_model.g.dart';

@JsonSerializable()
class RedditChildDataModel {
  final String title;
  final RedditPreviewModel preview;

  RedditChildDataModel({this.title, this.preview});

  factory RedditChildDataModel.fromJson(Map<String, dynamic> json) =>
      _$RedditChildDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedditChildDataModelToJson(this);
}
