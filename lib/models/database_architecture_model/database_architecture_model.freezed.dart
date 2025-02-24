// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'database_architecture_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DatabaseArchitecture _$DatabaseArchitectureFromJson(Map<String, dynamic> json) {
  return _DatabaseArchitecture.fromJson(json);
}

/// @nodoc
mixin _$DatabaseArchitecture {
  String get question => throw _privateConstructorUsedError;
  List<String> get answers => throw _privateConstructorUsedError;

  /// Serializes this DatabaseArchitecture to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DatabaseArchitecture
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DatabaseArchitectureCopyWith<DatabaseArchitecture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatabaseArchitectureCopyWith<$Res> {
  factory $DatabaseArchitectureCopyWith(DatabaseArchitecture value,
          $Res Function(DatabaseArchitecture) then) =
      _$DatabaseArchitectureCopyWithImpl<$Res, DatabaseArchitecture>;
  @useResult
  $Res call({String question, List<String> answers});
}

/// @nodoc
class _$DatabaseArchitectureCopyWithImpl<$Res,
        $Val extends DatabaseArchitecture>
    implements $DatabaseArchitectureCopyWith<$Res> {
  _$DatabaseArchitectureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DatabaseArchitecture
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatabaseArchitectureImplCopyWith<$Res>
    implements $DatabaseArchitectureCopyWith<$Res> {
  factory _$$DatabaseArchitectureImplCopyWith(_$DatabaseArchitectureImpl value,
          $Res Function(_$DatabaseArchitectureImpl) then) =
      __$$DatabaseArchitectureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String question, List<String> answers});
}

/// @nodoc
class __$$DatabaseArchitectureImplCopyWithImpl<$Res>
    extends _$DatabaseArchitectureCopyWithImpl<$Res, _$DatabaseArchitectureImpl>
    implements _$$DatabaseArchitectureImplCopyWith<$Res> {
  __$$DatabaseArchitectureImplCopyWithImpl(_$DatabaseArchitectureImpl _value,
      $Res Function(_$DatabaseArchitectureImpl) _then)
      : super(_value, _then);

  /// Create a copy of DatabaseArchitecture
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answers = null,
  }) {
    return _then(_$DatabaseArchitectureImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DatabaseArchitectureImpl implements _DatabaseArchitecture {
  const _$DatabaseArchitectureImpl(
      {required this.question, required final List<String> answers})
      : _answers = answers;

  factory _$DatabaseArchitectureImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatabaseArchitectureImplFromJson(json);

  @override
  final String question;
  final List<String> _answers;
  @override
  List<String> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'DatabaseArchitecture(question: $question, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabaseArchitectureImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, question, const DeepCollectionEquality().hash(_answers));

  /// Create a copy of DatabaseArchitecture
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DatabaseArchitectureImplCopyWith<_$DatabaseArchitectureImpl>
      get copyWith =>
          __$$DatabaseArchitectureImplCopyWithImpl<_$DatabaseArchitectureImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DatabaseArchitectureImplToJson(
      this,
    );
  }
}

abstract class _DatabaseArchitecture implements DatabaseArchitecture {
  const factory _DatabaseArchitecture(
      {required final String question,
      required final List<String> answers}) = _$DatabaseArchitectureImpl;

  factory _DatabaseArchitecture.fromJson(Map<String, dynamic> json) =
      _$DatabaseArchitectureImpl.fromJson;

  @override
  String get question;
  @override
  List<String> get answers;

  /// Create a copy of DatabaseArchitecture
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DatabaseArchitectureImplCopyWith<_$DatabaseArchitectureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
