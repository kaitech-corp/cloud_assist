// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) =>
    _ServiceModel(
      category: json['category'] as String?,
      description: json['description'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Services.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceModelToJson(_ServiceModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'description': instance.description,
      'services': instance.services,
    };

_Services _$ServicesFromJson(Map<String, dynamic> json) => _Services(
  service: json['service'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$ServicesToJson(_Services instance) => <String, dynamic>{
  'service': instance.service,
  'description': instance.description,
};
