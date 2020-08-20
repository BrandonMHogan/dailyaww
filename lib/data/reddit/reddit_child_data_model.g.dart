// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_child_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditChildDataModel _$RedditChildDataModelFromJson(Map<String, dynamic> json) {
  return RedditChildDataModel(
    id: json['id'] as String,
    title: json['title'] as String,
    created: (json['created'] as num)?.toDouble(),
    preview: json['preview'] == null
        ? null
        : RedditPreviewModel.fromJson(json['preview'] as Map<String, dynamic>),
    media: json['secure_media'] == null
        ? null
        : RedditMediaModel.fromJson(
            json['secure_media'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RedditChildDataModelToJson(
        RedditChildDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'created': instance.created,
      'preview': instance.preview,
      'secure_media': instance.media,
    };
