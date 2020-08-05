// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_child_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditChildModel _$RedditChildModelFromJson(Map<String, dynamic> json) {
  return RedditChildModel(
    kind: json['kind'] as String,
    data: json['data'] == null
        ? null
        : RedditChildDataModel.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RedditChildModelToJson(RedditChildModel instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'data': instance.data,
    };
