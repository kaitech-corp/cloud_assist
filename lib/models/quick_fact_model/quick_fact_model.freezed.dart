// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quick_fact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuickFact {

 String get fact; String get docID; String get service; String get flag;@TimestampConverter() DateTime? get timestamp;
/// Create a copy of QuickFact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuickFactCopyWith<QuickFact> get copyWith => _$QuickFactCopyWithImpl<QuickFact>(this as QuickFact, _$identity);

  /// Serializes this QuickFact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuickFact&&(identical(other.fact, fact) || other.fact == fact)&&(identical(other.docID, docID) || other.docID == docID)&&(identical(other.service, service) || other.service == service)&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fact,docID,service,flag,timestamp);

@override
String toString() {
  return 'QuickFact(fact: $fact, docID: $docID, service: $service, flag: $flag, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $QuickFactCopyWith<$Res>  {
  factory $QuickFactCopyWith(QuickFact value, $Res Function(QuickFact) _then) = _$QuickFactCopyWithImpl;
@useResult
$Res call({
 String fact, String docID, String service, String flag,@TimestampConverter() DateTime? timestamp
});




}
/// @nodoc
class _$QuickFactCopyWithImpl<$Res>
    implements $QuickFactCopyWith<$Res> {
  _$QuickFactCopyWithImpl(this._self, this._then);

  final QuickFact _self;
  final $Res Function(QuickFact) _then;

/// Create a copy of QuickFact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fact = null,Object? docID = null,Object? service = null,Object? flag = null,Object? timestamp = freezed,}) {
  return _then(_self.copyWith(
fact: null == fact ? _self.fact : fact // ignore: cast_nullable_to_non_nullable
as String,docID: null == docID ? _self.docID : docID // ignore: cast_nullable_to_non_nullable
as String,service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as String,flag: null == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as String,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuickFact].
extension QuickFactPatterns on QuickFact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuickFact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuickFact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuickFact value)  $default,){
final _that = this;
switch (_that) {
case _QuickFact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuickFact value)?  $default,){
final _that = this;
switch (_that) {
case _QuickFact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fact,  String docID,  String service,  String flag, @TimestampConverter()  DateTime? timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuickFact() when $default != null:
return $default(_that.fact,_that.docID,_that.service,_that.flag,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fact,  String docID,  String service,  String flag, @TimestampConverter()  DateTime? timestamp)  $default,) {final _that = this;
switch (_that) {
case _QuickFact():
return $default(_that.fact,_that.docID,_that.service,_that.flag,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fact,  String docID,  String service,  String flag, @TimestampConverter()  DateTime? timestamp)?  $default,) {final _that = this;
switch (_that) {
case _QuickFact() when $default != null:
return $default(_that.fact,_that.docID,_that.service,_that.flag,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuickFact implements QuickFact {
  const _QuickFact({required this.fact, required this.docID, required this.service, required this.flag, @TimestampConverter() this.timestamp});
  factory _QuickFact.fromJson(Map<String, dynamic> json) => _$QuickFactFromJson(json);

@override final  String fact;
@override final  String docID;
@override final  String service;
@override final  String flag;
@override@TimestampConverter() final  DateTime? timestamp;

/// Create a copy of QuickFact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuickFactCopyWith<_QuickFact> get copyWith => __$QuickFactCopyWithImpl<_QuickFact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuickFactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuickFact&&(identical(other.fact, fact) || other.fact == fact)&&(identical(other.docID, docID) || other.docID == docID)&&(identical(other.service, service) || other.service == service)&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fact,docID,service,flag,timestamp);

@override
String toString() {
  return 'QuickFact(fact: $fact, docID: $docID, service: $service, flag: $flag, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$QuickFactCopyWith<$Res> implements $QuickFactCopyWith<$Res> {
  factory _$QuickFactCopyWith(_QuickFact value, $Res Function(_QuickFact) _then) = __$QuickFactCopyWithImpl;
@override @useResult
$Res call({
 String fact, String docID, String service, String flag,@TimestampConverter() DateTime? timestamp
});




}
/// @nodoc
class __$QuickFactCopyWithImpl<$Res>
    implements _$QuickFactCopyWith<$Res> {
  __$QuickFactCopyWithImpl(this._self, this._then);

  final _QuickFact _self;
  final $Res Function(_QuickFact) _then;

/// Create a copy of QuickFact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fact = null,Object? docID = null,Object? service = null,Object? flag = null,Object? timestamp = freezed,}) {
  return _then(_QuickFact(
fact: null == fact ? _self.fact : fact // ignore: cast_nullable_to_non_nullable
as String,docID: null == docID ? _self.docID : docID // ignore: cast_nullable_to_non_nullable
as String,service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as String,flag: null == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as String,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
