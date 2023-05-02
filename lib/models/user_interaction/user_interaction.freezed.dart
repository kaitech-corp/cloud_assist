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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInteractionModel _$UserInteractionModelFromJson(Map<Object?, dynamic> json) {
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_UserInteractionModelCopyWith<$Res>
    implements $UserInteractionModelCopyWith<$Res> {
  factory _$$_UserInteractionModelCopyWith(_$_UserInteractionModel value,
          $Res Function(_$_UserInteractionModel) then) =
      __$$_UserInteractionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? serviceId,
      String? featureId,
      @TimestampConverter() DateTime? startTime,
      @TimestampConverter() DateTime? endTime});
}

/// @nodoc
class __$$_UserInteractionModelCopyWithImpl<$Res>
    extends _$UserInteractionModelCopyWithImpl<$Res, _$_UserInteractionModel>
    implements _$$_UserInteractionModelCopyWith<$Res> {
  __$$_UserInteractionModelCopyWithImpl(_$_UserInteractionModel _value,
      $Res Function(_$_UserInteractionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = freezed,
    Object? featureId = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$_UserInteractionModel(
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
class _$_UserInteractionModel implements _UserInteractionModel {
  const _$_UserInteractionModel(
      {this.serviceId,
      this.featureId,
      @TimestampConverter() this.startTime,
      @TimestampConverter() this.endTime});

  factory _$_UserInteractionModel.fromJson(Map<Object?, dynamic> json) =>
      _$$_UserInteractionModelFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInteractionModel &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.featureId, featureId) ||
                other.featureId == featureId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, serviceId, featureId, startTime, endTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInteractionModelCopyWith<_$_UserInteractionModel> get copyWith =>
      __$$_UserInteractionModelCopyWithImpl<_$_UserInteractionModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInteractionModelToJson(
      this,
    );
  }
}

abstract class _UserInteractionModel implements UserInteractionModel {
  const factory _UserInteractionModel(
      {final String? serviceId,
      final String? featureId,
      @TimestampConverter() final DateTime? startTime,
      @TimestampConverter() final DateTime? endTime}) = _$_UserInteractionModel;

  factory _UserInteractionModel.fromJson(Map<Object?, dynamic> json) =
      _$_UserInteractionModel.fromJson;

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
  @override
  @JsonKey(ignore: true)
  _$$_UserInteractionModelCopyWith<_$_UserInteractionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
