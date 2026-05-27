// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gcloud_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GCloudData implements DiagnosticableTreeMixin {

 String get topic; String get title; Map<String, String> get commands;
/// Create a copy of GCloudData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GCloudDataCopyWith<GCloudData> get copyWith => _$GCloudDataCopyWithImpl<GCloudData>(this as GCloudData, _$identity);

  /// Serializes this GCloudData to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GCloudData'))
    ..add(DiagnosticsProperty('topic', topic))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('commands', commands));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GCloudData&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.commands, commands));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topic,title,const DeepCollectionEquality().hash(commands));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GCloudData(topic: $topic, title: $title, commands: $commands)';
}


}

/// @nodoc
abstract mixin class $GCloudDataCopyWith<$Res>  {
  factory $GCloudDataCopyWith(GCloudData value, $Res Function(GCloudData) _then) = _$GCloudDataCopyWithImpl;
@useResult
$Res call({
 String topic, String title, Map<String, String> commands
});




}
/// @nodoc
class _$GCloudDataCopyWithImpl<$Res>
    implements $GCloudDataCopyWith<$Res> {
  _$GCloudDataCopyWithImpl(this._self, this._then);

  final GCloudData _self;
  final $Res Function(GCloudData) _then;

/// Create a copy of GCloudData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topic = null,Object? title = null,Object? commands = null,}) {
  return _then(_self.copyWith(
topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,commands: null == commands ? _self.commands : commands // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [GCloudData].
extension GCloudDataPatterns on GCloudData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GCloudData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GCloudData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GCloudData value)  $default,){
final _that = this;
switch (_that) {
case _GCloudData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GCloudData value)?  $default,){
final _that = this;
switch (_that) {
case _GCloudData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String topic,  String title,  Map<String, String> commands)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GCloudData() when $default != null:
return $default(_that.topic,_that.title,_that.commands);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String topic,  String title,  Map<String, String> commands)  $default,) {final _that = this;
switch (_that) {
case _GCloudData():
return $default(_that.topic,_that.title,_that.commands);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String topic,  String title,  Map<String, String> commands)?  $default,) {final _that = this;
switch (_that) {
case _GCloudData() when $default != null:
return $default(_that.topic,_that.title,_that.commands);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GCloudData with DiagnosticableTreeMixin implements GCloudData {
  const _GCloudData({required this.topic, required this.title, required final  Map<String, String> commands}): _commands = commands;
  factory _GCloudData.fromJson(Map<String, dynamic> json) => _$GCloudDataFromJson(json);

@override final  String topic;
@override final  String title;
 final  Map<String, String> _commands;
@override Map<String, String> get commands {
  if (_commands is EqualUnmodifiableMapView) return _commands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_commands);
}


/// Create a copy of GCloudData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GCloudDataCopyWith<_GCloudData> get copyWith => __$GCloudDataCopyWithImpl<_GCloudData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GCloudDataToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GCloudData'))
    ..add(DiagnosticsProperty('topic', topic))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('commands', commands));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GCloudData&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._commands, _commands));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topic,title,const DeepCollectionEquality().hash(_commands));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GCloudData(topic: $topic, title: $title, commands: $commands)';
}


}

/// @nodoc
abstract mixin class _$GCloudDataCopyWith<$Res> implements $GCloudDataCopyWith<$Res> {
  factory _$GCloudDataCopyWith(_GCloudData value, $Res Function(_GCloudData) _then) = __$GCloudDataCopyWithImpl;
@override @useResult
$Res call({
 String topic, String title, Map<String, String> commands
});




}
/// @nodoc
class __$GCloudDataCopyWithImpl<$Res>
    implements _$GCloudDataCopyWith<$Res> {
  __$GCloudDataCopyWithImpl(this._self, this._then);

  final _GCloudData _self;
  final $Res Function(_GCloudData) _then;

/// Create a copy of GCloudData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topic = null,Object? title = null,Object? commands = null,}) {
  return _then(_GCloudData(
topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,commands: null == commands ? _self._commands : commands // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

// dart format on
