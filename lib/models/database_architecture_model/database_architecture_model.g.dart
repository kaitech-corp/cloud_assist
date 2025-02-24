// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_architecture_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DatabaseArchitectureImpl _$$DatabaseArchitectureImplFromJson(
        Map<String, dynamic> json) =>
    _$DatabaseArchitectureImpl(
      question: json['question'] as String,
      answers:
          (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$DatabaseArchitectureImplToJson(
        _$DatabaseArchitectureImpl instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers,
    };
