// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'database_architecture_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DatabaseArchitecture {

 String get question; List<String> get answers;
/// Create a copy of DatabaseArchitecture
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DatabaseArchitectureCopyWith<DatabaseArchitecture> get copyWith => _$DatabaseArchitectureCopyWithImpl<DatabaseArchitecture>(this as DatabaseArchitecture, _$identity);

  /// Serializes this DatabaseArchitecture to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DatabaseArchitecture&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.answers, answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,const DeepCollectionEquality().hash(answers));

@override
String toString() {
  return 'DatabaseArchitecture(question: $question, answers: $answers)';
}


}

/// @nodoc
abstract mixin class $DatabaseArchitectureCopyWith<$Res>  {
  factory $DatabaseArchitectureCopyWith(DatabaseArchitecture value, $Res Function(DatabaseArchitecture) _then) = _$DatabaseArchitectureCopyWithImpl;
@useResult
$Res call({
 String question, List<String> answers
});




}
/// @nodoc
class _$DatabaseArchitectureCopyWithImpl<$Res>
    implements $DatabaseArchitectureCopyWith<$Res> {
  _$DatabaseArchitectureCopyWithImpl(this._self, this._then);

  final DatabaseArchitecture _self;
  final $Res Function(DatabaseArchitecture) _then;

/// Create a copy of DatabaseArchitecture
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? question = null,Object? answers = null,}) {
  return _then(_self.copyWith(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [DatabaseArchitecture].
extension DatabaseArchitecturePatterns on DatabaseArchitecture {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DatabaseArchitecture value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DatabaseArchitecture() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DatabaseArchitecture value)  $default,){
final _that = this;
switch (_that) {
case _DatabaseArchitecture():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DatabaseArchitecture value)?  $default,){
final _that = this;
switch (_that) {
case _DatabaseArchitecture() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String question,  List<String> answers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DatabaseArchitecture() when $default != null:
return $default(_that.question,_that.answers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String question,  List<String> answers)  $default,) {final _that = this;
switch (_that) {
case _DatabaseArchitecture():
return $default(_that.question,_that.answers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String question,  List<String> answers)?  $default,) {final _that = this;
switch (_that) {
case _DatabaseArchitecture() when $default != null:
return $default(_that.question,_that.answers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DatabaseArchitecture implements DatabaseArchitecture {
  const _DatabaseArchitecture({required this.question, required final  List<String> answers}): _answers = answers;
  factory _DatabaseArchitecture.fromJson(Map<String, dynamic> json) => _$DatabaseArchitectureFromJson(json);

@override final  String question;
 final  List<String> _answers;
@override List<String> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}


/// Create a copy of DatabaseArchitecture
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DatabaseArchitectureCopyWith<_DatabaseArchitecture> get copyWith => __$DatabaseArchitectureCopyWithImpl<_DatabaseArchitecture>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DatabaseArchitectureToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DatabaseArchitecture&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other._answers, _answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,const DeepCollectionEquality().hash(_answers));

@override
String toString() {
  return 'DatabaseArchitecture(question: $question, answers: $answers)';
}


}

/// @nodoc
abstract mixin class _$DatabaseArchitectureCopyWith<$Res> implements $DatabaseArchitectureCopyWith<$Res> {
  factory _$DatabaseArchitectureCopyWith(_DatabaseArchitecture value, $Res Function(_DatabaseArchitecture) _then) = __$DatabaseArchitectureCopyWithImpl;
@override @useResult
$Res call({
 String question, List<String> answers
});




}
/// @nodoc
class __$DatabaseArchitectureCopyWithImpl<$Res>
    implements _$DatabaseArchitectureCopyWith<$Res> {
  __$DatabaseArchitectureCopyWithImpl(this._self, this._then);

  final _DatabaseArchitecture _self;
  final $Res Function(_DatabaseArchitecture) _then;

/// Create a copy of DatabaseArchitecture
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? question = null,Object? answers = null,}) {
  return _then(_DatabaseArchitecture(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
