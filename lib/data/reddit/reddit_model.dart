import 'package:json_annotation/json_annotation.dart';

import 'reddit_data_model.dart';

part 'reddit_model.g.dart';

@JsonSerializable()
class RedditModel {
  final String kind;
  final RedditDataModel data;

  RedditModel({this.kind, this.data});

  factory RedditModel.fromJson(Map<String, dynamic> json) =>
      _$RedditModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedditModelToJson(this);
}
