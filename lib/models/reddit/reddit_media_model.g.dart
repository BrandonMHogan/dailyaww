// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditMediaModel _$RedditMediaModelFromJson(Map<String, dynamic> json) {
  return RedditMediaModel(
    video: json['reddit_video'] == null
        ? null
        : RedditVideoModel.fromJson(
            json['reddit_video'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RedditMediaModelToJson(RedditMediaModel instance) =>
    <String, dynamic>{
      'reddit_video': instance.video,
    };
