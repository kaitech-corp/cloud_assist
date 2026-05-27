// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_content_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportContent {

 String get content; String get reportType; String get contentDocID; String? get contentField;@TimestampConverter() DateTime? get timestamp;
/// Create a copy of ReportContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportContentCopyWith<ReportContent> get copyWith => _$ReportContentCopyWithImpl<ReportContent>(this as ReportContent, _$identity);

  /// Serializes this ReportContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportContent&&(identical(other.content, content) || other.content == content)&&(identical(other.reportType, reportType) || other.reportType == reportType)&&(identical(other.contentDocID, contentDocID) || other.contentDocID == contentDocID)&&(identical(other.contentField, contentField) || other.contentField == contentField)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content,reportType,contentDocID,contentField,timestamp);

@override
String toString() {
  return 'ReportContent(content: $content, reportType: $reportType, contentDocID: $contentDocID, contentField: $contentField, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $ReportContentCopyWith<$Res>  {
  factory $ReportContentCopyWith(ReportContent value, $Res Function(ReportContent) _then) = _$ReportContentCopyWithImpl;
@useResult
$Res call({
 String content, String reportType, String contentDocID, String? contentField,@TimestampConverter() DateTime? timestamp
});




}
/// @nodoc
class _$ReportContentCopyWithImpl<$Res>
    implements $ReportContentCopyWith<$Res> {
  _$ReportContentCopyWithImpl(this._self, this._then);

  final ReportContent _self;
  final $Res Function(ReportContent) _then;

/// Create a copy of ReportContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? reportType = null,Object? contentDocID = null,Object? contentField = freezed,Object? timestamp = freezed,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,reportType: null == reportType ? _self.reportType : reportType // ignore: cast_nullable_to_non_nullable
as String,contentDocID: null == contentDocID ? _self.contentDocID : contentDocID // ignore: cast_nullable_to_non_nullable
as String,contentField: freezed == contentField ? _self.contentField : contentField // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportContent].
extension ReportContentPatterns on ReportContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportContent value)  $default,){
final _that = this;
switch (_that) {
case _ReportContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportContent value)?  $default,){
final _that = this;
switch (_that) {
case _ReportContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String content,  String reportType,  String contentDocID,  String? contentField, @TimestampConverter()  DateTime? timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportContent() when $default != null:
return $default(_that.content,_that.reportType,_that.contentDocID,_that.contentField,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String content,  String reportType,  String contentDocID,  String? contentField, @TimestampConverter()  DateTime? timestamp)  $default,) {final _that = this;
switch (_that) {
case _ReportContent():
return $default(_that.content,_that.reportType,_that.contentDocID,_that.contentField,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String content,  String reportType,  String contentDocID,  String? contentField, @TimestampConverter()  DateTime? timestamp)?  $default,) {final _that = this;
switch (_that) {
case _ReportContent() when $default != null:
return $default(_that.content,_that.reportType,_that.contentDocID,_that.contentField,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportContent implements ReportContent {
  const _ReportContent({required this.content, required this.reportType, required this.contentDocID, this.contentField, @TimestampConverter() this.timestamp});
  factory _ReportContent.fromJson(Map<String, dynamic> json) => _$ReportContentFromJson(json);

@override final  String content;
@override final  String reportType;
@override final  String contentDocID;
@override final  String? contentField;
@override@TimestampConverter() final  DateTime? timestamp;

/// Create a copy of ReportContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportContentCopyWith<_ReportContent> get copyWith => __$ReportContentCopyWithImpl<_ReportContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportContent&&(identical(other.content, content) || other.content == content)&&(identical(other.reportType, reportType) || other.reportType == reportType)&&(identical(other.contentDocID, contentDocID) || other.contentDocID == contentDocID)&&(identical(other.contentField, contentField) || other.contentField == contentField)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content,reportType,contentDocID,contentField,timestamp);

@override
String toString() {
  return 'ReportContent(content: $content, reportType: $reportType, contentDocID: $contentDocID, contentField: $contentField, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$ReportContentCopyWith<$Res> implements $ReportContentCopyWith<$Res> {
  factory _$ReportContentCopyWith(_ReportContent value, $Res Function(_ReportContent) _then) = __$ReportContentCopyWithImpl;
@override @useResult
$Res call({
 String content, String reportType, String contentDocID, String? contentField,@TimestampConverter() DateTime? timestamp
});




}
/// @nodoc
class __$ReportContentCopyWithImpl<$Res>
    implements _$ReportContentCopyWith<$Res> {
  __$ReportContentCopyWithImpl(this._self, this._then);

  final _ReportContent _self;
  final $Res Function(_ReportContent) _then;

/// Create a copy of ReportContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? reportType = null,Object? contentDocID = null,Object? contentField = freezed,Object? timestamp = freezed,}) {
  return _then(_ReportContent(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,reportType: null == reportType ? _self.reportType : reportType // ignore: cast_nullable_to_non_nullable
as String,contentDocID: null == contentDocID ? _self.contentDocID : contentDocID // ignore: cast_nullable_to_non_nullable
as String,contentField: freezed == contentField ? _self.contentField : contentField // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
