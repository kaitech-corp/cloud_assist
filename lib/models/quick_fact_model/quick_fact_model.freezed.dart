// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quick_fact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuickFact _$QuickFactFromJson(Map<String, dynamic> json) {
  return _QuickFact.fromJson(json);
}

/// @nodoc
mixin _$QuickFact {
  String get fact => throw _privateConstructorUsedError;
  String get docID => throw _privateConstructorUsedError;
  String get service => throw _privateConstructorUsedError;
  String get flag => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuickFactCopyWith<QuickFact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickFactCopyWith<$Res> {
  factory $QuickFactCopyWith(QuickFact value, $Res Function(QuickFact) then) =
      _$QuickFactCopyWithImpl<$Res, QuickFact>;
  @useResult
  $Res call(
      {String fact,
      String docID,
      String service,
      String flag,
      @TimestampConverter() DateTime? timestamp});
}

/// @nodoc
class _$QuickFactCopyWithImpl<$Res, $Val extends QuickFact>
    implements $QuickFactCopyWith<$Res> {
  _$QuickFactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fact = null,
    Object? docID = null,
    Object? service = null,
    Object? flag = null,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      fact: null == fact
          ? _value.fact
          : fact // ignore: cast_nullable_to_non_nullable
              as String,
      docID: null == docID
          ? _value.docID
          : docID // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuickFactCopyWith<$Res> implements $QuickFactCopyWith<$Res> {
  factory _$$_QuickFactCopyWith(
          _$_QuickFact value, $Res Function(_$_QuickFact) then) =
      __$$_QuickFactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fact,
      String docID,
      String service,
      String flag,
      @TimestampConverter() DateTime? timestamp});
}

/// @nodoc
class __$$_QuickFactCopyWithImpl<$Res>
    extends _$QuickFactCopyWithImpl<$Res, _$_QuickFact>
    implements _$$_QuickFactCopyWith<$Res> {
  __$$_QuickFactCopyWithImpl(
      _$_QuickFact _value, $Res Function(_$_QuickFact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fact = null,
    Object? docID = null,
    Object? service = null,
    Object? flag = null,
    Object? timestamp = freezed,
  }) {
    return _then(_$_QuickFact(
      fact: null == fact
          ? _value.fact
          : fact // ignore: cast_nullable_to_non_nullable
              as String,
      docID: null == docID
          ? _value.docID
          : docID // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuickFact implements _QuickFact {
  const _$_QuickFact(
      {required this.fact,
      required this.docID,
      required this.service,
      required this.flag,
      @TimestampConverter() this.timestamp});

  factory _$_QuickFact.fromJson(Map<String, dynamic> json) =>
      _$$_QuickFactFromJson(json);

  @override
  final String fact;
  @override
  final String docID;
  @override
  final String service;
  @override
  final String flag;
  @override
  @TimestampConverter()
  final DateTime? timestamp;

  @override
  String toString() {
    return 'QuickFact(fact: $fact, docID: $docID, service: $service, flag: $flag, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuickFact &&
            (identical(other.fact, fact) || other.fact == fact) &&
            (identical(other.docID, docID) || other.docID == docID) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.flag, flag) || other.flag == flag) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fact, docID, service, flag, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuickFactCopyWith<_$_QuickFact> get copyWith =>
      __$$_QuickFactCopyWithImpl<_$_QuickFact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuickFactToJson(
      this,
    );
  }
}

abstract class _QuickFact implements QuickFact {
  const factory _QuickFact(
      {required final String fact,
      required final String docID,
      required final String service,
      required final String flag,
      @TimestampConverter() final DateTime? timestamp}) = _$_QuickFact;

  factory _QuickFact.fromJson(Map<String, dynamic> json) =
      _$_QuickFact.fromJson;

  @override
  String get fact;
  @override
  String get docID;
  @override
  String get service;
  @override
  String get flag;
  @override
  @TimestampConverter()
  DateTime? get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$_QuickFactCopyWith<_$_QuickFact> get copyWith =>
      throw _privateConstructorUsedError;
}
