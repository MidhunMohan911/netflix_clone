// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      image: json['poster_path'] as String?,
      overview: json['overview'] as String?,
      releasedate: json['release_date'] as String?,
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.image,
      'overview': instance.overview,
      'release_date': instance.releasedate,
    };
