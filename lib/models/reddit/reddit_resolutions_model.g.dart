// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_resolutions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditResolutionsModel _$RedditResolutionsModelFromJson(
    Map<String, dynamic> json) {
  return RedditResolutionsModel(
    url: json['url'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
  );
}

Map<String, dynamic> _$RedditResolutionsModelToJson(
        RedditResolutionsModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
