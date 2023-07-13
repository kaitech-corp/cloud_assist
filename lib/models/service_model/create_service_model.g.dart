// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names, always_specify_types

part of 'create_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceModel _$$_ServiceModelFromJson(Map<String, dynamic> json) =>
    _$_ServiceModel(
      category: json['category'] as String?,
      description: json['description'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Services.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ServiceModelToJson(_$_ServiceModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'description': instance.description,
      'services': instance.services,
    };

_$_Services _$$_ServicesFromJson(Map<String, dynamic> json) => _$_Services(
      service: json['service'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_ServicesToJson(_$_Services instance) =>
    <String, dynamic>{
      'service': instance.service,
      'description': instance.description,
    };
