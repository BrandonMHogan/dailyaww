// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_images_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditImagesModel _$RedditImagesModelFromJson(Map<String, dynamic> json) {
  return RedditImagesModel(
    source: json['source'] == null
        ? null
        : RedditResolutionsModel.fromJson(
            json['source'] as Map<String, dynamic>),
    resolutions: (json['resolutions'] as List)
        ?.map((e) => e == null
            ? null
            : RedditResolutionsModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RedditImagesModelToJson(RedditImagesModel instance) =>
    <String, dynamic>{
      'source': instance.source,
      'resolutions': instance.resolutions,
    };
