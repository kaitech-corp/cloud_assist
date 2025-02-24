// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AgentData _$AgentDataFromJson(Map<String, dynamic> json) {
  return _AgentData.fromJson(json);
}

/// @nodoc
mixin _$AgentData {
  String get agent => throw _privateConstructorUsedError;
  String get context => throw _privateConstructorUsedError;
  Map<String, Object?> get response => throw _privateConstructorUsedError;
  String get response_id => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get timestamp => throw _privateConstructorUsedError;
  String get topic_id => throw _privateConstructorUsedError;
  String get user_id => throw _privateConstructorUsedError;

  /// Serializes this AgentData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentDataCopyWith<AgentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentDataCopyWith<$Res> {
  factory $AgentDataCopyWith(AgentData value, $Res Function(AgentData) then) =
      _$AgentDataCopyWithImpl<$Res, AgentData>;
  @useResult
  $Res call(
      {String agent,
      String context,
      Map<String, Object?> response,
      String response_id,
      @TimestampConverter() DateTime? timestamp,
      String topic_id,
      String user_id});
}

/// @nodoc
class _$AgentDataCopyWithImpl<$Res, $Val extends AgentData>
    implements $AgentDataCopyWith<$Res> {
  _$AgentDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agent = null,
    Object? context = null,
    Object? response = null,
    Object? response_id = null,
    Object? timestamp = freezed,
    Object? topic_id = null,
    Object? user_id = null,
  }) {
    return _then(_value.copyWith(
      agent: null == agent
          ? _value.agent
          : agent // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      response_id: null == response_id
          ? _value.response_id
          : response_id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      topic_id: null == topic_id
          ? _value.topic_id
          : topic_id // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgentDataImplCopyWith<$Res>
    implements $AgentDataCopyWith<$Res> {
  factory _$$AgentDataImplCopyWith(
          _$AgentDataImpl value, $Res Function(_$AgentDataImpl) then) =
      __$$AgentDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String agent,
      String context,
      Map<String, Object?> response,
      String response_id,
      @TimestampConverter() DateTime? timestamp,
      String topic_id,
      String user_id});
}

/// @nodoc
class __$$AgentDataImplCopyWithImpl<$Res>
    extends _$AgentDataCopyWithImpl<$Res, _$AgentDataImpl>
    implements _$$AgentDataImplCopyWith<$Res> {
  __$$AgentDataImplCopyWithImpl(
      _$AgentDataImpl _value, $Res Function(_$AgentDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agent = null,
    Object? context = null,
    Object? response = null,
    Object? response_id = null,
    Object? timestamp = freezed,
    Object? topic_id = null,
    Object? user_id = null,
  }) {
    return _then(_$AgentDataImpl(
      agent: null == agent
          ? _value.agent
          : agent // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      response: null == response
          ? _value._response
          : response // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      response_id: null == response_id
          ? _value.response_id
          : response_id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      topic_id: null == topic_id
          ? _value.topic_id
          : topic_id // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgentDataImpl with DiagnosticableTreeMixin implements _AgentData {
  const _$AgentDataImpl(
      {required this.agent,
      required this.context,
      required final Map<String, Object?> response,
      required this.response_id,
      @TimestampConverter() this.timestamp,
      required this.topic_id,
      required this.user_id})
      : _response = response;

  factory _$AgentDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentDataImplFromJson(json);

  @override
  final String agent;
  @override
  final String context;
  final Map<String, Object?> _response;
  @override
  Map<String, Object?> get response {
    if (_response is EqualUnmodifiableMapView) return _response;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_response);
  }

  @override
  final String response_id;
  @override
  @TimestampConverter()
  final DateTime? timestamp;
  @override
  final String topic_id;
  @override
  final String user_id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AgentData(agent: $agent, context: $context, response: $response, response_id: $response_id, timestamp: $timestamp, topic_id: $topic_id, user_id: $user_id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AgentData'))
      ..add(DiagnosticsProperty('agent', agent))
      ..add(DiagnosticsProperty('context', context))
      ..add(DiagnosticsProperty('response', response))
      ..add(DiagnosticsProperty('response_id', response_id))
      ..add(DiagnosticsProperty('timestamp', timestamp))
      ..add(DiagnosticsProperty('topic_id', topic_id))
      ..add(DiagnosticsProperty('user_id', user_id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentDataImpl &&
            (identical(other.agent, agent) || other.agent == agent) &&
            (identical(other.context, context) || other.context == context) &&
            const DeepCollectionEquality().equals(other._response, _response) &&
            (identical(other.response_id, response_id) ||
                other.response_id == response_id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.topic_id, topic_id) ||
                other.topic_id == topic_id) &&
            (identical(other.user_id, user_id) || other.user_id == user_id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      agent,
      context,
      const DeepCollectionEquality().hash(_response),
      response_id,
      timestamp,
      topic_id,
      user_id);

  /// Create a copy of AgentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentDataImplCopyWith<_$AgentDataImpl> get copyWith =>
      __$$AgentDataImplCopyWithImpl<_$AgentDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentDataImplToJson(
      this,
    );
  }
}

abstract class _AgentData implements AgentData {
  const factory _AgentData(
      {required final String agent,
      required final String context,
      required final Map<String, Object?> response,
      required final String response_id,
      @TimestampConverter() final DateTime? timestamp,
      required final String topic_id,
      required final String user_id}) = _$AgentDataImpl;

  factory _AgentData.fromJson(Map<String, dynamic> json) =
      _$AgentDataImpl.fromJson;

  @override
  String get agent;
  @override
  String get context;
  @override
  Map<String, Object?> get response;
  @override
  String get response_id;
  @override
  @TimestampConverter()
  DateTime? get timestamp;
  @override
  String get topic_id;
  @override
  String get user_id;

  /// Create a copy of AgentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentDataImplCopyWith<_$AgentDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
