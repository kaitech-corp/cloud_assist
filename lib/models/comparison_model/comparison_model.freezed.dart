// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comparison_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ComparisonModel _$ComparisonModelFromJson(Map<String, dynamic> json) {
  return _ComparisonModel.fromJson(json);
}

/// @nodoc
mixin _$ComparisonModel {
  String get answer => throw _privateConstructorUsedError;
  String get docID => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get timestamp => throw _privateConstructorUsedError;
  List<Map<String, String>> get answersSelected =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComparisonModelCopyWith<ComparisonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComparisonModelCopyWith<$Res> {
  factory $ComparisonModelCopyWith(
          ComparisonModel value, $Res Function(ComparisonModel) then) =
      _$ComparisonModelCopyWithImpl<$Res, ComparisonModel>;
  @useResult
  $Res call(
      {String answer,
      String docID,
      @TimestampConverter() DateTime? timestamp,
      List<Map<String, String>> answersSelected});
}

/// @nodoc
class _$ComparisonModelCopyWithImpl<$Res, $Val extends ComparisonModel>
    implements $ComparisonModelCopyWith<$Res> {
  _$ComparisonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? docID = null,
    Object? timestamp = freezed,
    Object? answersSelected = null,
  }) {
    return _then(_value.copyWith(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      docID: null == docID
          ? _value.docID
          : docID // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      answersSelected: null == answersSelected
          ? _value.answersSelected
          : answersSelected // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ComparisonModelCopyWith<$Res>
    implements $ComparisonModelCopyWith<$Res> {
  factory _$$_ComparisonModelCopyWith(
          _$_ComparisonModel value, $Res Function(_$_ComparisonModel) then) =
      __$$_ComparisonModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String answer,
      String docID,
      @TimestampConverter() DateTime? timestamp,
      List<Map<String, String>> answersSelected});
}

/// @nodoc
class __$$_ComparisonModelCopyWithImpl<$Res>
    extends _$ComparisonModelCopyWithImpl<$Res, _$_ComparisonModel>
    implements _$$_ComparisonModelCopyWith<$Res> {
  __$$_ComparisonModelCopyWithImpl(
      _$_ComparisonModel _value, $Res Function(_$_ComparisonModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? docID = null,
    Object? timestamp = freezed,
    Object? answersSelected = null,
  }) {
    return _then(_$_ComparisonModel(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      docID: null == docID
          ? _value.docID
          : docID // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      answersSelected: null == answersSelected
          ? _value._answersSelected
          : answersSelected // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ComparisonModel implements _ComparisonModel {
  const _$_ComparisonModel(
      {required this.answer,
      required this.docID,
      @TimestampConverter() this.timestamp,
      required final List<Map<String, String>> answersSelected})
      : _answersSelected = answersSelected;

  factory _$_ComparisonModel.fromJson(Map<String, dynamic> json) =>
      _$$_ComparisonModelFromJson(json);

  @override
  final String answer;
  @override
  final String docID;
  @override
  @TimestampConverter()
  final DateTime? timestamp;
  final List<Map<String, String>> _answersSelected;
  @override
  List<Map<String, String>> get answersSelected {
    if (_answersSelected is EqualUnmodifiableListView) return _answersSelected;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answersSelected);
  }

  @override
  String toString() {
    return 'ComparisonModel(answer: $answer, docID: $docID, timestamp: $timestamp, answersSelected: $answersSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ComparisonModel &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.docID, docID) || other.docID == docID) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality()
                .equals(other._answersSelected, _answersSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, answer, docID, timestamp,
      const DeepCollectionEquality().hash(_answersSelected));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ComparisonModelCopyWith<_$_ComparisonModel> get copyWith =>
      __$$_ComparisonModelCopyWithImpl<_$_ComparisonModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ComparisonModelToJson(
      this,
    );
  }
}

abstract class _ComparisonModel implements ComparisonModel {
  const factory _ComparisonModel(
          {required final String answer,
          required final String docID,
          @TimestampConverter() final DateTime? timestamp,
          required final List<Map<String, String>> answersSelected}) =
      _$_ComparisonModel;

  factory _ComparisonModel.fromJson(Map<String, dynamic> json) =
      _$_ComparisonModel.fromJson;

  @override
  String get answer;
  @override
  String get docID;
  @override
  @TimestampConverter()
  DateTime? get timestamp;
  @override
  List<Map<String, String>> get answersSelected;
  @override
  @JsonKey(ignore: true)
  _$$_ComparisonModelCopyWith<_$_ComparisonModel> get copyWith =>
      throw _privateConstructorUsedError;
}
