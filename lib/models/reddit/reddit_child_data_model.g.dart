// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_child_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditChildDataModel _$RedditChildDataModelFromJson(Map<String, dynamic> json) {
  return RedditChildDataModel(
    title: json['title'] as String,
    preview: json['preview'] == null
        ? null
        : RedditPreviewModel.fromJson(json['preview'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RedditChildDataModelToJson(
        RedditChildDataModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'preview': instance.preview,
    };
