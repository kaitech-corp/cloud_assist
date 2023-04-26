// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'user_interaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInteractionModel _$$_UserInteractionModelFromJson(
        Map<String, dynamic> json) =>
    _$_UserInteractionModel(
      serviceId: json['serviceId'] as String?,
      featureId: json['featureId'] as String?,
      startTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['startTime'], const TimestampConverter().fromJson),
      endTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['endTime'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$_UserInteractionModelToJson(
        _$_UserInteractionModel instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'featureId': instance.featureId,
      'startTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.startTime, const TimestampConverter().toJson),
      'endTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.endTime, const TimestampConverter().toJson),
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
