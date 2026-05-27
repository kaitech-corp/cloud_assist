// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comparison_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComparisonModel {

 String get answer; String get docID;@TimestampConverter() DateTime? get timestamp; List<Map<String, String>> get answersSelected;
/// Create a copy of ComparisonModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComparisonModelCopyWith<ComparisonModel> get copyWith => _$ComparisonModelCopyWithImpl<ComparisonModel>(this as ComparisonModel, _$identity);

  /// Serializes this ComparisonModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComparisonModel&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.docID, docID) || other.docID == docID)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.answersSelected, answersSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,answer,docID,timestamp,const DeepCollectionEquality().hash(answersSelected));

@override
String toString() {
  return 'ComparisonModel(answer: $answer, docID: $docID, timestamp: $timestamp, answersSelected: $answersSelected)';
}


}

/// @nodoc
abstract mixin class $ComparisonModelCopyWith<$Res>  {
  factory $ComparisonModelCopyWith(ComparisonModel value, $Res Function(ComparisonModel) _then) = _$ComparisonModelCopyWithImpl;
@useResult
$Res call({
 String answer, String docID,@TimestampConverter() DateTime? timestamp, List<Map<String, String>> answersSelected
});




}
/// @nodoc
class _$ComparisonModelCopyWithImpl<$Res>
    implements $ComparisonModelCopyWith<$Res> {
  _$ComparisonModelCopyWithImpl(this._self, this._then);

  final ComparisonModel _self;
  final $Res Function(ComparisonModel) _then;

/// Create a copy of ComparisonModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? answer = null,Object? docID = null,Object? timestamp = freezed,Object? answersSelected = null,}) {
  return _then(_self.copyWith(
answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,docID: null == docID ? _self.docID : docID // ignore: cast_nullable_to_non_nullable
as String,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,answersSelected: null == answersSelected ? _self.answersSelected : answersSelected // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}

}


/// Adds pattern-matching-related methods to [ComparisonModel].
extension ComparisonModelPatterns on ComparisonModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComparisonModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComparisonModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComparisonModel value)  $default,){
final _that = this;
switch (_that) {
case _ComparisonModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComparisonModel value)?  $default,){
final _that = this;
switch (_that) {
case _ComparisonModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String answer,  String docID, @TimestampConverter()  DateTime? timestamp,  List<Map<String, String>> answersSelected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComparisonModel() when $default != null:
return $default(_that.answer,_that.docID,_that.timestamp,_that.answersSelected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String answer,  String docID, @TimestampConverter()  DateTime? timestamp,  List<Map<String, String>> answersSelected)  $default,) {final _that = this;
switch (_that) {
case _ComparisonModel():
return $default(_that.answer,_that.docID,_that.timestamp,_that.answersSelected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String answer,  String docID, @TimestampConverter()  DateTime? timestamp,  List<Map<String, String>> answersSelected)?  $default,) {final _that = this;
switch (_that) {
case _ComparisonModel() when $default != null:
return $default(_that.answer,_that.docID,_that.timestamp,_that.answersSelected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComparisonModel implements ComparisonModel {
  const _ComparisonModel({required this.answer, required this.docID, @TimestampConverter() this.timestamp, required final  List<Map<String, String>> answersSelected}): _answersSelected = answersSelected;
  factory _ComparisonModel.fromJson(Map<String, dynamic> json) => _$ComparisonModelFromJson(json);

@override final  String answer;
@override final  String docID;
@override@TimestampConverter() final  DateTime? timestamp;
 final  List<Map<String, String>> _answersSelected;
@override List<Map<String, String>> get answersSelected {
  if (_answersSelected is EqualUnmodifiableListView) return _answersSelected;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answersSelected);
}


/// Create a copy of ComparisonModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComparisonModelCopyWith<_ComparisonModel> get copyWith => __$ComparisonModelCopyWithImpl<_ComparisonModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComparisonModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComparisonModel&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.docID, docID) || other.docID == docID)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other._answersSelected, _answersSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,answer,docID,timestamp,const DeepCollectionEquality().hash(_answersSelected));

@override
String toString() {
  return 'ComparisonModel(answer: $answer, docID: $docID, timestamp: $timestamp, answersSelected: $answersSelected)';
}


}

/// @nodoc
abstract mixin class _$ComparisonModelCopyWith<$Res> implements $ComparisonModelCopyWith<$Res> {
  factory _$ComparisonModelCopyWith(_ComparisonModel value, $Res Function(_ComparisonModel) _then) = __$ComparisonModelCopyWithImpl;
@override @useResult
$Res call({
 String answer, String docID,@TimestampConverter() DateTime? timestamp, List<Map<String, String>> answersSelected
});




}
/// @nodoc
class __$ComparisonModelCopyWithImpl<$Res>
    implements _$ComparisonModelCopyWith<$Res> {
  __$ComparisonModelCopyWithImpl(this._self, this._then);

  final _ComparisonModel _self;
  final $Res Function(_ComparisonModel) _then;

/// Create a copy of ComparisonModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? answer = null,Object? docID = null,Object? timestamp = freezed,Object? answersSelected = null,}) {
  return _then(_ComparisonModel(
answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,docID: null == docID ? _self.docID : docID // ignore: cast_nullable_to_non_nullable
as String,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,answersSelected: null == answersSelected ? _self._answersSelected : answersSelected // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}


}

// dart format on
