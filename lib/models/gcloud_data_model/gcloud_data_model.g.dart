// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gcloud_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GCloudData _$$_GCloudDataFromJson(Map<String, dynamic> json) =>
    _$_GCloudData(
      topic: json['topic'] as String,
      title: json['title'] as String,
      commands: (json['commands'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
    );

Map<String, dynamic> _$$_GCloudDataToJson(_$_GCloudData instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'title': instance.title,
      'commands': instance.commands,
    };
