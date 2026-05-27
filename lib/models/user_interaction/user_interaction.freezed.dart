// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_interaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserInteractionModel {

 String? get serviceId; String? get featureId;@TimestampConverter() DateTime? get startTime;@TimestampConverter() DateTime? get endTime;
/// Create a copy of UserInteractionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserInteractionModelCopyWith<UserInteractionModel> get copyWith => _$UserInteractionModelCopyWithImpl<UserInteractionModel>(this as UserInteractionModel, _$identity);

  /// Serializes this UserInteractionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserInteractionModel&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.featureId, featureId) || other.featureId == featureId)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceId,featureId,startTime,endTime);

@override
String toString() {
  return 'UserInteractionModel(serviceId: $serviceId, featureId: $featureId, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class $UserInteractionModelCopyWith<$Res>  {
  factory $UserInteractionModelCopyWith(UserInteractionModel value, $Res Function(UserInteractionModel) _then) = _$UserInteractionModelCopyWithImpl;
@useResult
$Res call({
 String? serviceId, String? featureId,@TimestampConverter() DateTime? startTime,@TimestampConverter() DateTime? endTime
});




}
/// @nodoc
class _$UserInteractionModelCopyWithImpl<$Res>
    implements $UserInteractionModelCopyWith<$Res> {
  _$UserInteractionModelCopyWithImpl(this._self, this._then);

  final UserInteractionModel _self;
  final $Res Function(UserInteractionModel) _then;

/// Create a copy of UserInteractionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceId = freezed,Object? featureId = freezed,Object? startTime = freezed,Object? endTime = freezed,}) {
  return _then(_self.copyWith(
serviceId: freezed == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String?,featureId: freezed == featureId ? _self.featureId : featureId // ignore: cast_nullable_to_non_nullable
as String?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserInteractionModel].
extension UserInteractionModelPatterns on UserInteractionModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserInteractionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserInteractionModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserInteractionModel value)  $default,){
final _that = this;
switch (_that) {
case _UserInteractionModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserInteractionModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserInteractionModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? serviceId,  String? featureId, @TimestampConverter()  DateTime? startTime, @TimestampConverter()  DateTime? endTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserInteractionModel() when $default != null:
return $default(_that.serviceId,_that.featureId,_that.startTime,_that.endTime);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? serviceId,  String? featureId, @TimestampConverter()  DateTime? startTime, @TimestampConverter()  DateTime? endTime)  $default,) {final _that = this;
switch (_that) {
case _UserInteractionModel():
return $default(_that.serviceId,_that.featureId,_that.startTime,_that.endTime);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? serviceId,  String? featureId, @TimestampConverter()  DateTime? startTime, @TimestampConverter()  DateTime? endTime)?  $default,) {final _that = this;
switch (_that) {
case _UserInteractionModel() when $default != null:
return $default(_that.serviceId,_that.featureId,_that.startTime,_that.endTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserInteractionModel implements UserInteractionModel {
  const _UserInteractionModel({this.serviceId, this.featureId, @TimestampConverter() this.startTime, @TimestampConverter() this.endTime});
  factory _UserInteractionModel.fromJson(Map<String, dynamic> json) => _$UserInteractionModelFromJson(json);

@override final  String? serviceId;
@override final  String? featureId;
@override@TimestampConverter() final  DateTime? startTime;
@override@TimestampConverter() final  DateTime? endTime;

/// Create a copy of UserInteractionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserInteractionModelCopyWith<_UserInteractionModel> get copyWith => __$UserInteractionModelCopyWithImpl<_UserInteractionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserInteractionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserInteractionModel&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.featureId, featureId) || other.featureId == featureId)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceId,featureId,startTime,endTime);

@override
String toString() {
  return 'UserInteractionModel(serviceId: $serviceId, featureId: $featureId, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class _$UserInteractionModelCopyWith<$Res> implements $UserInteractionModelCopyWith<$Res> {
  factory _$UserInteractionModelCopyWith(_UserInteractionModel value, $Res Function(_UserInteractionModel) _then) = __$UserInteractionModelCopyWithImpl;
@override @useResult
$Res call({
 String? serviceId, String? featureId,@TimestampConverter() DateTime? startTime,@TimestampConverter() DateTime? endTime
});




}
/// @nodoc
class __$UserInteractionModelCopyWithImpl<$Res>
    implements _$UserInteractionModelCopyWith<$Res> {
  __$UserInteractionModelCopyWithImpl(this._self, this._then);

  final _UserInteractionModel _self;
  final $Res Function(_UserInteractionModel) _then;

/// Create a copy of UserInteractionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceId = freezed,Object? featureId = freezed,Object? startTime = freezed,Object? endTime = freezed,}) {
  return _then(_UserInteractionModel(
serviceId: freezed == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String?,featureId: freezed == featureId ? _self.featureId : featureId // ignore: cast_nullable_to_non_nullable
as String?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
