// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloud_options_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CloudOptions {

 String get architecture; String get budget; String get dataAccessFrequency; String get dataConsistency; String get dataAccess; String get dataStorageType; String get dataSize; String get dataSecurity; String get dataGrowth; String get workload;
/// Create a copy of CloudOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudOptionsCopyWith<CloudOptions> get copyWith => _$CloudOptionsCopyWithImpl<CloudOptions>(this as CloudOptions, _$identity);

  /// Serializes this CloudOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudOptions&&(identical(other.architecture, architecture) || other.architecture == architecture)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.dataAccessFrequency, dataAccessFrequency) || other.dataAccessFrequency == dataAccessFrequency)&&(identical(other.dataConsistency, dataConsistency) || other.dataConsistency == dataConsistency)&&(identical(other.dataAccess, dataAccess) || other.dataAccess == dataAccess)&&(identical(other.dataStorageType, dataStorageType) || other.dataStorageType == dataStorageType)&&(identical(other.dataSize, dataSize) || other.dataSize == dataSize)&&(identical(other.dataSecurity, dataSecurity) || other.dataSecurity == dataSecurity)&&(identical(other.dataGrowth, dataGrowth) || other.dataGrowth == dataGrowth)&&(identical(other.workload, workload) || other.workload == workload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,architecture,budget,dataAccessFrequency,dataConsistency,dataAccess,dataStorageType,dataSize,dataSecurity,dataGrowth,workload);

@override
String toString() {
  return 'CloudOptions(architecture: $architecture, budget: $budget, dataAccessFrequency: $dataAccessFrequency, dataConsistency: $dataConsistency, dataAccess: $dataAccess, dataStorageType: $dataStorageType, dataSize: $dataSize, dataSecurity: $dataSecurity, dataGrowth: $dataGrowth, workload: $workload)';
}


}

/// @nodoc
abstract mixin class $CloudOptionsCopyWith<$Res>  {
  factory $CloudOptionsCopyWith(CloudOptions value, $Res Function(CloudOptions) _then) = _$CloudOptionsCopyWithImpl;
@useResult
$Res call({
 String architecture, String budget, String dataAccessFrequency, String dataConsistency, String dataAccess, String dataStorageType, String dataSize, String dataSecurity, String dataGrowth, String workload
});




}
/// @nodoc
class _$CloudOptionsCopyWithImpl<$Res>
    implements $CloudOptionsCopyWith<$Res> {
  _$CloudOptionsCopyWithImpl(this._self, this._then);

  final CloudOptions _self;
  final $Res Function(CloudOptions) _then;

/// Create a copy of CloudOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? architecture = null,Object? budget = null,Object? dataAccessFrequency = null,Object? dataConsistency = null,Object? dataAccess = null,Object? dataStorageType = null,Object? dataSize = null,Object? dataSecurity = null,Object? dataGrowth = null,Object? workload = null,}) {
  return _then(_self.copyWith(
architecture: null == architecture ? _self.architecture : architecture // ignore: cast_nullable_to_non_nullable
as String,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as String,dataAccessFrequency: null == dataAccessFrequency ? _self.dataAccessFrequency : dataAccessFrequency // ignore: cast_nullable_to_non_nullable
as String,dataConsistency: null == dataConsistency ? _self.dataConsistency : dataConsistency // ignore: cast_nullable_to_non_nullable
as String,dataAccess: null == dataAccess ? _self.dataAccess : dataAccess // ignore: cast_nullable_to_non_nullable
as String,dataStorageType: null == dataStorageType ? _self.dataStorageType : dataStorageType // ignore: cast_nullable_to_non_nullable
as String,dataSize: null == dataSize ? _self.dataSize : dataSize // ignore: cast_nullable_to_non_nullable
as String,dataSecurity: null == dataSecurity ? _self.dataSecurity : dataSecurity // ignore: cast_nullable_to_non_nullable
as String,dataGrowth: null == dataGrowth ? _self.dataGrowth : dataGrowth // ignore: cast_nullable_to_non_nullable
as String,workload: null == workload ? _self.workload : workload // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudOptions].
extension CloudOptionsPatterns on CloudOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudOptions value)  $default,){
final _that = this;
switch (_that) {
case _CloudOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudOptions value)?  $default,){
final _that = this;
switch (_that) {
case _CloudOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String architecture,  String budget,  String dataAccessFrequency,  String dataConsistency,  String dataAccess,  String dataStorageType,  String dataSize,  String dataSecurity,  String dataGrowth,  String workload)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudOptions() when $default != null:
return $default(_that.architecture,_that.budget,_that.dataAccessFrequency,_that.dataConsistency,_that.dataAccess,_that.dataStorageType,_that.dataSize,_that.dataSecurity,_that.dataGrowth,_that.workload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String architecture,  String budget,  String dataAccessFrequency,  String dataConsistency,  String dataAccess,  String dataStorageType,  String dataSize,  String dataSecurity,  String dataGrowth,  String workload)  $default,) {final _that = this;
switch (_that) {
case _CloudOptions():
return $default(_that.architecture,_that.budget,_that.dataAccessFrequency,_that.dataConsistency,_that.dataAccess,_that.dataStorageType,_that.dataSize,_that.dataSecurity,_that.dataGrowth,_that.workload);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String architecture,  String budget,  String dataAccessFrequency,  String dataConsistency,  String dataAccess,  String dataStorageType,  String dataSize,  String dataSecurity,  String dataGrowth,  String workload)?  $default,) {final _that = this;
switch (_that) {
case _CloudOptions() when $default != null:
return $default(_that.architecture,_that.budget,_that.dataAccessFrequency,_that.dataConsistency,_that.dataAccess,_that.dataStorageType,_that.dataSize,_that.dataSecurity,_that.dataGrowth,_that.workload);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudOptions implements CloudOptions {
  const _CloudOptions({required this.architecture, required this.budget, required this.dataAccessFrequency, required this.dataConsistency, required this.dataAccess, required this.dataStorageType, required this.dataSize, required this.dataSecurity, required this.dataGrowth, required this.workload});
  factory _CloudOptions.fromJson(Map<String, dynamic> json) => _$CloudOptionsFromJson(json);

@override final  String architecture;
@override final  String budget;
@override final  String dataAccessFrequency;
@override final  String dataConsistency;
@override final  String dataAccess;
@override final  String dataStorageType;
@override final  String dataSize;
@override final  String dataSecurity;
@override final  String dataGrowth;
@override final  String workload;

/// Create a copy of CloudOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudOptionsCopyWith<_CloudOptions> get copyWith => __$CloudOptionsCopyWithImpl<_CloudOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudOptions&&(identical(other.architecture, architecture) || other.architecture == architecture)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.dataAccessFrequency, dataAccessFrequency) || other.dataAccessFrequency == dataAccessFrequency)&&(identical(other.dataConsistency, dataConsistency) || other.dataConsistency == dataConsistency)&&(identical(other.dataAccess, dataAccess) || other.dataAccess == dataAccess)&&(identical(other.dataStorageType, dataStorageType) || other.dataStorageType == dataStorageType)&&(identical(other.dataSize, dataSize) || other.dataSize == dataSize)&&(identical(other.dataSecurity, dataSecurity) || other.dataSecurity == dataSecurity)&&(identical(other.dataGrowth, dataGrowth) || other.dataGrowth == dataGrowth)&&(identical(other.workload, workload) || other.workload == workload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,architecture,budget,dataAccessFrequency,dataConsistency,dataAccess,dataStorageType,dataSize,dataSecurity,dataGrowth,workload);

@override
String toString() {
  return 'CloudOptions(architecture: $architecture, budget: $budget, dataAccessFrequency: $dataAccessFrequency, dataConsistency: $dataConsistency, dataAccess: $dataAccess, dataStorageType: $dataStorageType, dataSize: $dataSize, dataSecurity: $dataSecurity, dataGrowth: $dataGrowth, workload: $workload)';
}


}

/// @nodoc
abstract mixin class _$CloudOptionsCopyWith<$Res> implements $CloudOptionsCopyWith<$Res> {
  factory _$CloudOptionsCopyWith(_CloudOptions value, $Res Function(_CloudOptions) _then) = __$CloudOptionsCopyWithImpl;
@override @useResult
$Res call({
 String architecture, String budget, String dataAccessFrequency, String dataConsistency, String dataAccess, String dataStorageType, String dataSize, String dataSecurity, String dataGrowth, String workload
});




}
/// @nodoc
class __$CloudOptionsCopyWithImpl<$Res>
    implements _$CloudOptionsCopyWith<$Res> {
  __$CloudOptionsCopyWithImpl(this._self, this._then);

  final _CloudOptions _self;
  final $Res Function(_CloudOptions) _then;

/// Create a copy of CloudOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? architecture = null,Object? budget = null,Object? dataAccessFrequency = null,Object? dataConsistency = null,Object? dataAccess = null,Object? dataStorageType = null,Object? dataSize = null,Object? dataSecurity = null,Object? dataGrowth = null,Object? workload = null,}) {
  return _then(_CloudOptions(
architecture: null == architecture ? _self.architecture : architecture // ignore: cast_nullable_to_non_nullable
as String,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as String,dataAccessFrequency: null == dataAccessFrequency ? _self.dataAccessFrequency : dataAccessFrequency // ignore: cast_nullable_to_non_nullable
as String,dataConsistency: null == dataConsistency ? _self.dataConsistency : dataConsistency // ignore: cast_nullable_to_non_nullable
as String,dataAccess: null == dataAccess ? _self.dataAccess : dataAccess // ignore: cast_nullable_to_non_nullable
as String,dataStorageType: null == dataStorageType ? _self.dataStorageType : dataStorageType // ignore: cast_nullable_to_non_nullable
as String,dataSize: null == dataSize ? _self.dataSize : dataSize // ignore: cast_nullable_to_non_nullable
as String,dataSecurity: null == dataSecurity ? _self.dataSecurity : dataSecurity // ignore: cast_nullable_to_non_nullable
as String,dataGrowth: null == dataGrowth ? _self.dataGrowth : dataGrowth // ignore: cast_nullable_to_non_nullable
as String,workload: null == workload ? _self.workload : workload // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
