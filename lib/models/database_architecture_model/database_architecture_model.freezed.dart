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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DatabaseArchitecture _$DatabaseArchitectureFromJson(Map<String, dynamic> json) {
  return _DatabaseArchitecture.fromJson(json);
}

/// @nodoc
mixin _$DatabaseArchitecture {
  String get question => throw _privateConstructorUsedError;
  List<String> get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_DatabaseArchitectureCopyWith<$Res>
    implements $DatabaseArchitectureCopyWith<$Res> {
  factory _$$_DatabaseArchitectureCopyWith(_$_DatabaseArchitecture value,
          $Res Function(_$_DatabaseArchitecture) then) =
      __$$_DatabaseArchitectureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String question, List<String> answers});
}

/// @nodoc
class __$$_DatabaseArchitectureCopyWithImpl<$Res>
    extends _$DatabaseArchitectureCopyWithImpl<$Res, _$_DatabaseArchitecture>
    implements _$$_DatabaseArchitectureCopyWith<$Res> {
  __$$_DatabaseArchitectureCopyWithImpl(_$_DatabaseArchitecture _value,
      $Res Function(_$_DatabaseArchitecture) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answers = null,
  }) {
    return _then(_$_DatabaseArchitecture(
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
class _$_DatabaseArchitecture implements _DatabaseArchitecture {
  const _$_DatabaseArchitecture(
      {required this.question, required final List<String> answers})
      : _answers = answers;

  factory _$_DatabaseArchitecture.fromJson(Map<String, dynamic> json) =>
      _$$_DatabaseArchitectureFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DatabaseArchitecture &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, question, const DeepCollectionEquality().hash(_answers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DatabaseArchitectureCopyWith<_$_DatabaseArchitecture> get copyWith =>
      __$$_DatabaseArchitectureCopyWithImpl<_$_DatabaseArchitecture>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DatabaseArchitectureToJson(
      this,
    );
  }
}

abstract class _DatabaseArchitecture implements DatabaseArchitecture {
  const factory _DatabaseArchitecture(
      {required final String question,
      required final List<String> answers}) = _$_DatabaseArchitecture;

  factory _DatabaseArchitecture.fromJson(Map<String, dynamic> json) =
      _$_DatabaseArchitecture.fromJson;

  @override
  String get question;
  @override
  List<String> get answers;
  @override
  @JsonKey(ignore: true)
  _$$_DatabaseArchitectureCopyWith<_$_DatabaseArchitecture> get copyWith =>
      throw _privateConstructorUsedError;
}
