// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names, always_specify_types

part of 'cloud_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CloudData _$$_CloudDataFromJson(Map<String, dynamic> json) => _$_CloudData(
      service: json['service'] as String,
      description: json['description'] as String,
      detail: json['detail'] as String,
      link: json['link'] as String,
      provider: json['provider'] as String,
      type: json['type'] as String,
      benefits:
          (json['benefits'] as List<dynamic>).map((e) => e as String).toList(),
      cons: (json['cons'] as List<dynamic>).map((e) => e as String).toList(),
      useCases:
          (json['useCases'] as List<dynamic>).map((e) => e as String).toList(),
      example: json['example'] as String,
    );

Map<String, dynamic> _$$_CloudDataToJson(_$_CloudData instance) =>
    <String, dynamic>{
      'service': instance.service,
      'description': instance.description,
      'detail': instance.detail,
      'link': instance.link,
      'provider': instance.provider,
      'type': instance.type,
      'benefits': instance.benefits,
      'cons': instance.cons,
      'useCases': instance.useCases,
      'example': instance.example,
    };
