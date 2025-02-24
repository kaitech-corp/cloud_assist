// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_options_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CloudOptionsImpl _$$CloudOptionsImplFromJson(Map<String, dynamic> json) =>
    _$CloudOptionsImpl(
      architecture: json['architecture'] as String,
      budget: json['budget'] as String,
      dataAccessFrequency: json['dataAccessFrequency'] as String,
      dataConsistency: json['dataConsistency'] as String,
      dataAccess: json['dataAccess'] as String,
      dataStorageType: json['dataStorageType'] as String,
      dataSize: json['dataSize'] as String,
      dataSecurity: json['dataSecurity'] as String,
      dataGrowth: json['dataGrowth'] as String,
      workload: json['workload'] as String,
    );

Map<String, dynamic> _$$CloudOptionsImplToJson(_$CloudOptionsImpl instance) =>
    <String, dynamic>{
      'architecture': instance.architecture,
      'budget': instance.budget,
      'dataAccessFrequency': instance.dataAccessFrequency,
      'dataConsistency': instance.dataConsistency,
      'dataAccess': instance.dataAccess,
      'dataStorageType': instance.dataStorageType,
      'dataSize': instance.dataSize,
      'dataSecurity': instance.dataSecurity,
      'dataGrowth': instance.dataGrowth,
      'workload': instance.workload,
    };
