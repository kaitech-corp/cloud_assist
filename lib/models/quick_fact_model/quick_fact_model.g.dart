// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'quick_fact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuickFact _$$_QuickFactFromJson(Map<String, dynamic> json) => _$_QuickFact(
      fact: json['fact'] as String,
      docID: json['docID'] as String,
      service: json['service'] as String,
      flag: json['flag'] as String,
      timestamp: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['timestamp'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$_QuickFactToJson(_$_QuickFact instance) =>
    <String, dynamic>{
      'fact': instance.fact,
      'docID': instance.docID,
      'service': instance.service,
      'flag': instance.flag,
      'timestamp': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.timestamp, const TimestampConverter().toJson),
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
