// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportModel {

 String get content; String get docID; List<String> get tags; String get title;@TimestampConverter() DateTime? get timestamp;
/// Create a copy of ReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportModelCopyWith<ReportModel> get copyWith => _$ReportModelCopyWithImpl<ReportModel>(this as ReportModel, _$identity);

  /// Serializes this ReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportModel&&(identical(other.content, content) || other.content == content)&&(identical(other.docID, docID) || other.docID == docID)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.title, title) || other.title == title)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content,docID,const DeepCollectionEquality().hash(tags),title,timestamp);

@override
String toString() {
  return 'ReportModel(content: $content, docID: $docID, tags: $tags, title: $title, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $ReportModelCopyWith<$Res>  {
  factory $ReportModelCopyWith(ReportModel value, $Res Function(ReportModel) _then) = _$ReportModelCopyWithImpl;
@useResult
$Res call({
 String content, String docID, List<String> tags, String title,@TimestampConverter() DateTime? timestamp
});




}
/// @nodoc
class _$ReportModelCopyWithImpl<$Res>
    implements $ReportModelCopyWith<$Res> {
  _$ReportModelCopyWithImpl(this._self, this._then);

  final ReportModel _self;
  final $Res Function(ReportModel) _then;

/// Create a copy of ReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? docID = null,Object? tags = null,Object? title = null,Object? timestamp = freezed,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,docID: null == docID ? _self.docID : docID // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportModel].
extension ReportModelPatterns on ReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportModel value)  $default,){
final _that = this;
switch (_that) {
case _ReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String content,  String docID,  List<String> tags,  String title, @TimestampConverter()  DateTime? timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportModel() when $default != null:
return $default(_that.content,_that.docID,_that.tags,_that.title,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String content,  String docID,  List<String> tags,  String title, @TimestampConverter()  DateTime? timestamp)  $default,) {final _that = this;
switch (_that) {
case _ReportModel():
return $default(_that.content,_that.docID,_that.tags,_that.title,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String content,  String docID,  List<String> tags,  String title, @TimestampConverter()  DateTime? timestamp)?  $default,) {final _that = this;
switch (_that) {
case _ReportModel() when $default != null:
return $default(_that.content,_that.docID,_that.tags,_that.title,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportModel implements ReportModel {
  const _ReportModel({required this.content, required this.docID, required final  List<String> tags, required this.title, @TimestampConverter() this.timestamp}): _tags = tags;
  factory _ReportModel.fromJson(Map<String, dynamic> json) => _$ReportModelFromJson(json);

@override final  String content;
@override final  String docID;
 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  String title;
@override@TimestampConverter() final  DateTime? timestamp;

/// Create a copy of ReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportModelCopyWith<_ReportModel> get copyWith => __$ReportModelCopyWithImpl<_ReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportModel&&(identical(other.content, content) || other.content == content)&&(identical(other.docID, docID) || other.docID == docID)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.title, title) || other.title == title)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content,docID,const DeepCollectionEquality().hash(_tags),title,timestamp);

@override
String toString() {
  return 'ReportModel(content: $content, docID: $docID, tags: $tags, title: $title, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$ReportModelCopyWith<$Res> implements $ReportModelCopyWith<$Res> {
  factory _$ReportModelCopyWith(_ReportModel value, $Res Function(_ReportModel) _then) = __$ReportModelCopyWithImpl;
@override @useResult
$Res call({
 String content, String docID, List<String> tags, String title,@TimestampConverter() DateTime? timestamp
});




}
/// @nodoc
class __$ReportModelCopyWithImpl<$Res>
    implements _$ReportModelCopyWith<$Res> {
  __$ReportModelCopyWithImpl(this._self, this._then);

  final _ReportModel _self;
  final $Res Function(_ReportModel) _then;

/// Create a copy of ReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? docID = null,Object? tags = null,Object? title = null,Object? timestamp = freezed,}) {
  return _then(_ReportModel(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,docID: null == docID ? _self.docID : docID // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
