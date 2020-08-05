// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditModel _$RedditModelFromJson(Map<String, dynamic> json) {
  return RedditModel(
    kind: json['kind'] as String,
    data: json['data'] == null
        ? null
        : RedditDataModel.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RedditModelToJson(RedditModel instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'data': instance.data,
    };
