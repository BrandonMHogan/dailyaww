// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_preview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditPreviewModel _$RedditPreviewModelFromJson(Map<String, dynamic> json) {
  return RedditPreviewModel(
    images: (json['images'] as List)
        ?.map((e) => e == null
            ? null
            : RedditImagesModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RedditPreviewModelToJson(RedditPreviewModel instance) =>
    <String, dynamic>{
      'images': instance.images,
    };
