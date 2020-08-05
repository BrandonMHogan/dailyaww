import 'package:dailyaww/models/reddit/reddit_child_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reddit_data_model.g.dart';

@JsonSerializable()
class RedditDataModel {
  final String modhash;
  final int dist;
  final List<RedditChildModel> children;

  RedditDataModel({this.modhash, this.dist, this.children});

  factory RedditDataModel.fromJson(Map<String, dynamic> json) =>
      _$RedditDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedditDataModelToJson(this);
}
