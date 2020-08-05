import 'package:dailyaww/models/reddit/reddit_child_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reddit_child_model.g.dart';

@JsonSerializable()
class RedditChildModel {
  final String kind;
  final RedditChildDataModel data;

  RedditChildModel({this.kind, this.data});

  factory RedditChildModel.fromJson(Map<String, dynamic> json) =>
      _$RedditChildModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedditChildModelToJson(this);
}
