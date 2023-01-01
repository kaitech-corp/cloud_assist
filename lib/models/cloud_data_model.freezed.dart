// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloud_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CloudData _$CloudDataFromJson(Map<String, dynamic> json) {
  return _CloudData.fromJson(json);
}

/// @nodoc
mixin _$CloudData {
  String get service => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  List<String> get benefits => throw _privateConstructorUsedError;
  List<String> get cons => throw _privateConstructorUsedError;
  List<String> get useCases => throw _privateConstructorUsedError;
  String get example => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CloudDataCopyWith<CloudData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CloudDataCopyWith<$Res> {
  factory $CloudDataCopyWith(CloudData value, $Res Function(CloudData) then) =
      _$CloudDataCopyWithImpl<$Res, CloudData>;
  @useResult
  $Res call(
      {String service,
      String description,
      String detail,
      List<String> benefits,
      List<String> cons,
      List<String> useCases,
      String example});
}

/// @nodoc
class _$CloudDataCopyWithImpl<$Res, $Val extends CloudData>
    implements $CloudDataCopyWith<$Res> {
  _$CloudDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = null,
    Object? description = null,
    Object? detail = null,
    Object? benefits = null,
    Object? cons = null,
    Object? useCases = null,
    Object? example = null,
  }) {
    return _then(_value.copyWith(
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      benefits: null == benefits
          ? _value.benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cons: null == cons
          ? _value.cons
          : cons // ignore: cast_nullable_to_non_nullable
              as List<String>,
      useCases: null == useCases
          ? _value.useCases
          : useCases // ignore: cast_nullable_to_non_nullable
              as List<String>,
      example: null == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CloudDataCopyWith<$Res> implements $CloudDataCopyWith<$Res> {
  factory _$$_CloudDataCopyWith(
          _$_CloudData value, $Res Function(_$_CloudData) then) =
      __$$_CloudDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String service,
      String description,
      String detail,
      List<String> benefits,
      List<String> cons,
      List<String> useCases,
      String example});
}

/// @nodoc
class __$$_CloudDataCopyWithImpl<$Res>
    extends _$CloudDataCopyWithImpl<$Res, _$_CloudData>
    implements _$$_CloudDataCopyWith<$Res> {
  __$$_CloudDataCopyWithImpl(
      _$_CloudData _value, $Res Function(_$_CloudData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = null,
    Object? description = null,
    Object? detail = null,
    Object? benefits = null,
    Object? cons = null,
    Object? useCases = null,
    Object? example = null,
  }) {
    return _then(_$_CloudData(
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      benefits: null == benefits
          ? _value._benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cons: null == cons
          ? _value._cons
          : cons // ignore: cast_nullable_to_non_nullable
              as List<String>,
      useCases: null == useCases
          ? _value._useCases
          : useCases // ignore: cast_nullable_to_non_nullable
              as List<String>,
      example: null == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CloudData with DiagnosticableTreeMixin implements _CloudData {
  const _$_CloudData(
      {required this.service,
      required this.description,
      required this.detail,
      required final List<String> benefits,
      required final List<String> cons,
      required final List<String> useCases,
      required this.example})
      : _benefits = benefits,
        _cons = cons,
        _useCases = useCases;

  factory _$_CloudData.fromJson(Map<String, dynamic> json) =>
      _$$_CloudDataFromJson(json);

  @override
  final String service;
  @override
  final String description;
  @override
  final String detail;
  final List<String> _benefits;
  @override
  List<String> get benefits {
    if (_benefits is EqualUnmodifiableListView) return _benefits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_benefits);
  }

  final List<String> _cons;
  @override
  List<String> get cons {
    if (_cons is EqualUnmodifiableListView) return _cons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cons);
  }

  final List<String> _useCases;
  @override
  List<String> get useCases {
    if (_useCases is EqualUnmodifiableListView) return _useCases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_useCases);
  }

  @override
  final String example;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CloudData(service: $service, description: $description, detail: $detail, benefits: $benefits, cons: $cons, useCases: $useCases, example: $example)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CloudData'))
      ..add(DiagnosticsProperty('service', service))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('detail', detail))
      ..add(DiagnosticsProperty('benefits', benefits))
      ..add(DiagnosticsProperty('cons', cons))
      ..add(DiagnosticsProperty('useCases', useCases))
      ..add(DiagnosticsProperty('example', example));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CloudData &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            const DeepCollectionEquality().equals(other._benefits, _benefits) &&
            const DeepCollectionEquality().equals(other._cons, _cons) &&
            const DeepCollectionEquality().equals(other._useCases, _useCases) &&
            (identical(other.example, example) || other.example == example));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      service,
      description,
      detail,
      const DeepCollectionEquality().hash(_benefits),
      const DeepCollectionEquality().hash(_cons),
      const DeepCollectionEquality().hash(_useCases),
      example);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CloudDataCopyWith<_$_CloudData> get copyWith =>
      __$$_CloudDataCopyWithImpl<_$_CloudData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CloudDataToJson(
      this,
    );
  }
}

abstract class _CloudData implements CloudData {
  const factory _CloudData(
      {required final String service,
      required final String description,
      required final String detail,
      required final List<String> benefits,
      required final List<String> cons,
      required final List<String> useCases,
      required final String example}) = _$_CloudData;

  factory _CloudData.fromJson(Map<String, dynamic> json) =
      _$_CloudData.fromJson;

  @override
  String get service;
  @override
  String get description;
  @override
  String get detail;
  @override
  List<String> get benefits;
  @override
  List<String> get cons;
  @override
  List<String> get useCases;
  @override
  String get example;
  @override
  @JsonKey(ignore: true)
  _$$_CloudDataCopyWith<_$_CloudData> get copyWith =>
      throw _privateConstructorUsedError;
}
