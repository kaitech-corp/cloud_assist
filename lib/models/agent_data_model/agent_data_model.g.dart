// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgentDataImpl _$$AgentDataImplFromJson(Map<String, dynamic> json) =>
    _$AgentDataImpl(
      agent: json['agent'] as String,
      context: json['context'] as String,
      response: json['response'] as Map<String, dynamic>,
      response_id: json['response_id'] as String,
      timestamp: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['timestamp'], const TimestampConverter().fromJson),
      topic_id: json['topic_id'] as String,
      user_id: json['user_id'] as String,
    );

Map<String, dynamic> _$$AgentDataImplToJson(_$AgentDataImpl instance) =>
    <String, dynamic>{
      'agent': instance.agent,
      'context': instance.context,
      'response': instance.response,
      'response_id': instance.response_id,
      'timestamp': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.timestamp, const TimestampConverter().toJson),
      'topic_id': instance.topic_id,
      'user_id': instance.user_id,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
