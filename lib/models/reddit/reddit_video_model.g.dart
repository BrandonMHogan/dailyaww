// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditVideoModel _$RedditVideoModelFromJson(Map<String, dynamic> json) {
  return RedditVideoModel(
    url: json['fallback_url'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    isGif: json['is_gif'] as bool,
  );
}

Map<String, dynamic> _$RedditVideoModelToJson(RedditVideoModel instance) =>
    <String, dynamic>{
      'fallback_url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'is_gif': instance.isGif,
    };
