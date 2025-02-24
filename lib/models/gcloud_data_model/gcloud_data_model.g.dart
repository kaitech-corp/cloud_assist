// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gcloud_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GCloudDataImpl _$$GCloudDataImplFromJson(Map<String, dynamic> json) =>
    _$GCloudDataImpl(
      topic: json['topic'] as String,
      title: json['title'] as String,
      commands: Map<String, String>.from(json['commands'] as Map),
    );

Map<String, dynamic> _$$GCloudDataImplToJson(_$GCloudDataImpl instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'title': instance.title,
      'commands': instance.commands,
    };
