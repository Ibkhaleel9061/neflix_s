// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DownloadsImpl _$$DownloadsImplFromJson(Map<String, dynamic> json) =>
    _$DownloadsImpl(
      posterPath: json['poster_path'] as String?,
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$DownloadsImplToJson(_$DownloadsImpl instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
      'id': instance.id,
      'title': instance.title,
    };
