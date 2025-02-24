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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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

  /// Serializes this ComparisonModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ComparisonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of ComparisonModel
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$ComparisonModelImplCopyWith<$Res>
    implements $ComparisonModelCopyWith<$Res> {
  factory _$$ComparisonModelImplCopyWith(_$ComparisonModelImpl value,
          $Res Function(_$ComparisonModelImpl) then) =
      __$$ComparisonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String answer,
      String docID,
      @TimestampConverter() DateTime? timestamp,
      List<Map<String, String>> answersSelected});
}

/// @nodoc
class __$$ComparisonModelImplCopyWithImpl<$Res>
    extends _$ComparisonModelCopyWithImpl<$Res, _$ComparisonModelImpl>
    implements _$$ComparisonModelImplCopyWith<$Res> {
  __$$ComparisonModelImplCopyWithImpl(
      _$ComparisonModelImpl _value, $Res Function(_$ComparisonModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ComparisonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? docID = null,
    Object? timestamp = freezed,
    Object? answersSelected = null,
  }) {
    return _then(_$ComparisonModelImpl(
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
class _$ComparisonModelImpl implements _ComparisonModel {
  const _$ComparisonModelImpl(
      {required this.answer,
      required this.docID,
      @TimestampConverter() this.timestamp,
      required final List<Map<String, String>> answersSelected})
      : _answersSelected = answersSelected;

  factory _$ComparisonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComparisonModelImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComparisonModelImpl &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.docID, docID) || other.docID == docID) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality()
                .equals(other._answersSelected, _answersSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, answer, docID, timestamp,
      const DeepCollectionEquality().hash(_answersSelected));

  /// Create a copy of ComparisonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComparisonModelImplCopyWith<_$ComparisonModelImpl> get copyWith =>
      __$$ComparisonModelImplCopyWithImpl<_$ComparisonModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComparisonModelImplToJson(
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
      _$ComparisonModelImpl;

  factory _ComparisonModel.fromJson(Map<String, dynamic> json) =
      _$ComparisonModelImpl.fromJson;

  @override
  String get answer;
  @override
  String get docID;
  @override
  @TimestampConverter()
  DateTime? get timestamp;
  @override
  List<Map<String, String>> get answersSelected;

  /// Create a copy of ComparisonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComparisonModelImplCopyWith<_$ComparisonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
