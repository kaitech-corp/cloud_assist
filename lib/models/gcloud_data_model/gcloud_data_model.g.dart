// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gcloud_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GCloudData _$GCloudDataFromJson(Map<String, dynamic> json) => _GCloudData(
  topic: json['topic'] as String,
  title: json['title'] as String,
  commands: Map<String, String>.from(json['commands'] as Map),
);

Map<String, dynamic> _$GCloudDataToJson(_GCloudData instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'title': instance.title,
      'commands': instance.commands,
    };
