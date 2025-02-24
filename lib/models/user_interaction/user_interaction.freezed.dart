// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_interaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserInteractionModel _$UserInteractionModelFromJson(Map<String, dynamic> json) {
  return _UserInteractionModel.fromJson(json);
}

/// @nodoc
mixin _$UserInteractionModel {
  String? get serviceId => throw _privateConstructorUsedError;
  String? get featureId => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get startTime => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get endTime => throw _privateConstructorUsedError;

  /// Serializes this UserInteractionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserInteractionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInteractionModelCopyWith<UserInteractionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInteractionModelCopyWith<$Res> {
  factory $UserInteractionModelCopyWith(UserInteractionModel value,
          $Res Function(UserInteractionModel) then) =
      _$UserInteractionModelCopyWithImpl<$Res, UserInteractionModel>;
  @useResult
  $Res call(
      {String? serviceId,
      String? featureId,
      @TimestampConverter() DateTime? startTime,
      @TimestampConverter() DateTime? endTime});
}

/// @nodoc
class _$UserInteractionModelCopyWithImpl<$Res,
        $Val extends UserInteractionModel>
    implements $UserInteractionModelCopyWith<$Res> {
  _$UserInteractionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInteractionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = freezed,
    Object? featureId = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_value.copyWith(
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      featureId: freezed == featureId
          ? _value.featureId
          : featureId // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInteractionModelImplCopyWith<$Res>
    implements $UserInteractionModelCopyWith<$Res> {
  factory _$$UserInteractionModelImplCopyWith(_$UserInteractionModelImpl value,
          $Res Function(_$UserInteractionModelImpl) then) =
      __$$UserInteractionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? serviceId,
      String? featureId,
      @TimestampConverter() DateTime? startTime,
      @TimestampConverter() DateTime? endTime});
}

/// @nodoc
class __$$UserInteractionModelImplCopyWithImpl<$Res>
    extends _$UserInteractionModelCopyWithImpl<$Res, _$UserInteractionModelImpl>
    implements _$$UserInteractionModelImplCopyWith<$Res> {
  __$$UserInteractionModelImplCopyWithImpl(_$UserInteractionModelImpl _value,
      $Res Function(_$UserInteractionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInteractionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = freezed,
    Object? featureId = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$UserInteractionModelImpl(
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      featureId: freezed == featureId
          ? _value.featureId
          : featureId // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInteractionModelImpl implements _UserInteractionModel {
  const _$UserInteractionModelImpl(
      {this.serviceId,
      this.featureId,
      @TimestampConverter() this.startTime,
      @TimestampConverter() this.endTime});

  factory _$UserInteractionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInteractionModelImplFromJson(json);

  @override
  final String? serviceId;
  @override
  final String? featureId;
  @override
  @TimestampConverter()
  final DateTime? startTime;
  @override
  @TimestampConverter()
  final DateTime? endTime;

  @override
  String toString() {
    return 'UserInteractionModel(serviceId: $serviceId, featureId: $featureId, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInteractionModelImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.featureId, featureId) ||
                other.featureId == featureId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, serviceId, featureId, startTime, endTime);

  /// Create a copy of UserInteractionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInteractionModelImplCopyWith<_$UserInteractionModelImpl>
      get copyWith =>
          __$$UserInteractionModelImplCopyWithImpl<_$UserInteractionModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInteractionModelImplToJson(
      this,
    );
  }
}

abstract class _UserInteractionModel implements UserInteractionModel {
  const factory _UserInteractionModel(
          {final String? serviceId,
          final String? featureId,
          @TimestampConverter() final DateTime? startTime,
          @TimestampConverter() final DateTime? endTime}) =
      _$UserInteractionModelImpl;

  factory _UserInteractionModel.fromJson(Map<String, dynamic> json) =
      _$UserInteractionModelImpl.fromJson;

  @override
  String? get serviceId;
  @override
  String? get featureId;
  @override
  @TimestampConverter()
  DateTime? get startTime;
  @override
  @TimestampConverter()
  DateTime? get endTime;

  /// Create a copy of UserInteractionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInteractionModelImplCopyWith<_$UserInteractionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
