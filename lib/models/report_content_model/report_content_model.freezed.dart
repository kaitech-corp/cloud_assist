// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_content_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportContent _$ReportContentFromJson(Map<String, dynamic> json) {
  return _ReportContent.fromJson(json);
}

/// @nodoc
mixin _$ReportContent {
  String get content => throw _privateConstructorUsedError;
  String get reportType => throw _privateConstructorUsedError;
  String get contentDocID => throw _privateConstructorUsedError;
  String? get contentField => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportContentCopyWith<ReportContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportContentCopyWith<$Res> {
  factory $ReportContentCopyWith(
          ReportContent value, $Res Function(ReportContent) then) =
      _$ReportContentCopyWithImpl<$Res, ReportContent>;
  @useResult
  $Res call(
      {String content,
      String reportType,
      String contentDocID,
      String? contentField,
      @TimestampConverter() DateTime? timestamp});
}

/// @nodoc
class _$ReportContentCopyWithImpl<$Res, $Val extends ReportContent>
    implements $ReportContentCopyWith<$Res> {
  _$ReportContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? reportType = null,
    Object? contentDocID = null,
    Object? contentField = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      reportType: null == reportType
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as String,
      contentDocID: null == contentDocID
          ? _value.contentDocID
          : contentDocID // ignore: cast_nullable_to_non_nullable
              as String,
      contentField: freezed == contentField
          ? _value.contentField
          : contentField // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReportContentCopyWith<$Res>
    implements $ReportContentCopyWith<$Res> {
  factory _$$_ReportContentCopyWith(
          _$_ReportContent value, $Res Function(_$_ReportContent) then) =
      __$$_ReportContentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String content,
      String reportType,
      String contentDocID,
      String? contentField,
      @TimestampConverter() DateTime? timestamp});
}

/// @nodoc
class __$$_ReportContentCopyWithImpl<$Res>
    extends _$ReportContentCopyWithImpl<$Res, _$_ReportContent>
    implements _$$_ReportContentCopyWith<$Res> {
  __$$_ReportContentCopyWithImpl(
      _$_ReportContent _value, $Res Function(_$_ReportContent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? reportType = null,
    Object? contentDocID = null,
    Object? contentField = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$_ReportContent(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      reportType: null == reportType
          ? _value.reportType
          : reportType // ignore: cast_nullable_to_non_nullable
              as String,
      contentDocID: null == contentDocID
          ? _value.contentDocID
          : contentDocID // ignore: cast_nullable_to_non_nullable
              as String,
      contentField: freezed == contentField
          ? _value.contentField
          : contentField // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReportContent implements _ReportContent {
  const _$_ReportContent(
      {required this.content,
      required this.reportType,
      required this.contentDocID,
      this.contentField,
      @TimestampConverter() this.timestamp});

  factory _$_ReportContent.fromJson(Map<String, dynamic> json) =>
      _$$_ReportContentFromJson(json);

  @override
  final String content;
  @override
  final String reportType;
  @override
  final String contentDocID;
  @override
  final String? contentField;
  @override
  @TimestampConverter()
  final DateTime? timestamp;

  @override
  String toString() {
    return 'ReportContent(content: $content, reportType: $reportType, contentDocID: $contentDocID, contentField: $contentField, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportContent &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reportType, reportType) ||
                other.reportType == reportType) &&
            (identical(other.contentDocID, contentDocID) ||
                other.contentDocID == contentDocID) &&
            (identical(other.contentField, contentField) ||
                other.contentField == contentField) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, content, reportType, contentDocID, contentField, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportContentCopyWith<_$_ReportContent> get copyWith =>
      __$$_ReportContentCopyWithImpl<_$_ReportContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportContentToJson(
      this,
    );
  }
}

abstract class _ReportContent implements ReportContent {
  const factory _ReportContent(
      {required final String content,
      required final String reportType,
      required final String contentDocID,
      final String? contentField,
      @TimestampConverter() final DateTime? timestamp}) = _$_ReportContent;

  factory _ReportContent.fromJson(Map<String, dynamic> json) =
      _$_ReportContent.fromJson;

  @override
  String get content;
  @override
  String get reportType;
  @override
  String get contentDocID;
  @override
  String? get contentField;
  @override
  @TimestampConverter()
  DateTime? get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$_ReportContentCopyWith<_$_ReportContent> get copyWith =>
      throw _privateConstructorUsedError;
}
