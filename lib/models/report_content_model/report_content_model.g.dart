// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'report_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportContent _$$_ReportContentFromJson(Map<String, dynamic> json) =>
    _$_ReportContent(
      content: json['content'] as String,
      reportType: json['reportType'] as String,
      contentDocID: json['contentDocID'] as String,
      contentField: json['contentField'] as String?,
      timestamp: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['timestamp'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$_ReportContentToJson(_$_ReportContent instance) =>
    <String, dynamic>{
      'content': instance.content,
      'reportType': instance.reportType,
      'contentDocID': instance.contentDocID,
      'contentField': instance.contentField,
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
