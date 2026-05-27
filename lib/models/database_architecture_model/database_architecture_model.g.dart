// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_architecture_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DatabaseArchitecture _$DatabaseArchitectureFromJson(
  Map<String, dynamic> json,
) => _DatabaseArchitecture(
  question: json['question'] as String,
  answers: (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$DatabaseArchitectureToJson(
  _DatabaseArchitecture instance,
) => <String, dynamic>{
  'question': instance.question,
  'answers': instance.answers,
};
