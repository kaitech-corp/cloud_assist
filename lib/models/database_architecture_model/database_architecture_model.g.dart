// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names, always_specify_types

part of 'database_architecture_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DatabaseArchitecture _$$_DatabaseArchitectureFromJson(
        Map<String, dynamic> json) =>
    _$_DatabaseArchitecture(
      question: json['question'] as String,
      answers:
          (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_DatabaseArchitectureToJson(
        _$_DatabaseArchitecture instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers,
    };
