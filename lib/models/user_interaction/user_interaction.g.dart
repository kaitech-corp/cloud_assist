// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_interaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInteractionModelImpl _$$UserInteractionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserInteractionModelImpl(
      serviceId: json['serviceId'] as String?,
      featureId: json['featureId'] as String?,
      startTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['startTime'], const TimestampConverter().fromJson),
      endTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['endTime'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$UserInteractionModelImplToJson(
        _$UserInteractionModelImpl instance) =>
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
