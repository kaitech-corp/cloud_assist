// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gcloud_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GCloudData _$GCloudDataFromJson(Map<String, dynamic> json) {
  return _GCloudData.fromJson(json);
}

/// @nodoc
mixin _$GCloudData {
  String get topic => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<Map<String, String>> get commands => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GCloudDataCopyWith<GCloudData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GCloudDataCopyWith<$Res> {
  factory $GCloudDataCopyWith(
          GCloudData value, $Res Function(GCloudData) then) =
      _$GCloudDataCopyWithImpl<$Res, GCloudData>;
  @useResult
  $Res call({String topic, String title, List<Map<String, String>> commands});
}

/// @nodoc
class _$GCloudDataCopyWithImpl<$Res, $Val extends GCloudData>
    implements $GCloudDataCopyWith<$Res> {
  _$GCloudDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? title = null,
    Object? commands = null,
  }) {
    return _then(_value.copyWith(
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      commands: null == commands
          ? _value.commands
          : commands // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GCloudDataCopyWith<$Res>
    implements $GCloudDataCopyWith<$Res> {
  factory _$$_GCloudDataCopyWith(
          _$_GCloudData value, $Res Function(_$_GCloudData) then) =
      __$$_GCloudDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String topic, String title, List<Map<String, String>> commands});
}

/// @nodoc
class __$$_GCloudDataCopyWithImpl<$Res>
    extends _$GCloudDataCopyWithImpl<$Res, _$_GCloudData>
    implements _$$_GCloudDataCopyWith<$Res> {
  __$$_GCloudDataCopyWithImpl(
      _$_GCloudData _value, $Res Function(_$_GCloudData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? title = null,
    Object? commands = null,
  }) {
    return _then(_$_GCloudData(
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      commands: null == commands
          ? _value._commands
          : commands // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GCloudData with DiagnosticableTreeMixin implements _GCloudData {
  const _$_GCloudData(
      {required this.topic,
      required this.title,
      required final List<Map<String, String>> commands})
      : _commands = commands;

  factory _$_GCloudData.fromJson(Map<String, dynamic> json) =>
      _$$_GCloudDataFromJson(json);

  @override
  final String topic;
  @override
  final String title;
  final List<Map<String, String>> _commands;
  @override
  List<Map<String, String>> get commands {
    if (_commands is EqualUnmodifiableListView) return _commands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commands);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GCloudData(topic: $topic, title: $title, commands: $commands)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GCloudData'))
      ..add(DiagnosticsProperty('topic', topic))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('commands', commands));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GCloudData &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._commands, _commands));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, topic, title,
      const DeepCollectionEquality().hash(_commands));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GCloudDataCopyWith<_$_GCloudData> get copyWith =>
      __$$_GCloudDataCopyWithImpl<_$_GCloudData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GCloudDataToJson(
      this,
    );
  }
}

abstract class _GCloudData implements GCloudData {
  const factory _GCloudData(
      {required final String topic,
      required final String title,
      required final List<Map<String, String>> commands}) = _$_GCloudData;

  factory _GCloudData.fromJson(Map<String, dynamic> json) =
      _$_GCloudData.fromJson;

  @override
  String get topic;
  @override
  String get title;
  @override
  List<Map<String, String>> get commands;
  @override
  @JsonKey(ignore: true)
  _$$_GCloudDataCopyWith<_$_GCloudData> get copyWith =>
      throw _privateConstructorUsedError;
}
