// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceModelImpl _$$ServiceModelImplFromJson(Map<String, dynamic> json) =>
    _$ServiceModelImpl(
      category: json['category'] as String?,
      description: json['description'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Services.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ServiceModelImplToJson(_$ServiceModelImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'description': instance.description,
      'services': instance.services,
    };

_$ServicesImpl _$$ServicesImplFromJson(Map<String, dynamic> json) =>
    _$ServicesImpl(
      service: json['service'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$ServicesImplToJson(_$ServicesImpl instance) =>
    <String, dynamic>{
      'service': instance.service,
      'description': instance.description,
    };
