// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditDataModel _$RedditDataModelFromJson(Map<String, dynamic> json) {
  return RedditDataModel(
    modhash: json['modhash'] as String,
    dist: json['dist'] as int,
    children: (json['children'] as List)
        ?.map((e) => e == null
            ? null
            : RedditChildModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RedditDataModelToJson(RedditDataModel instance) =>
    <String, dynamic>{
      'modhash': instance.modhash,
      'dist': instance.dist,
      'children': instance.children,
    };
