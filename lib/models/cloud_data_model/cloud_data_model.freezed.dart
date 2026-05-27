// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloud_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CloudData implements DiagnosticableTreeMixin {

 String get service; String get description; String get detail; String get link; String get provider; String get type; List<String> get benefits; List<String> get cons; List<String> get useCases; String get example;
/// Create a copy of CloudData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudDataCopyWith<CloudData> get copyWith => _$CloudDataCopyWithImpl<CloudData>(this as CloudData, _$identity);

  /// Serializes this CloudData to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CloudData'))
    ..add(DiagnosticsProperty('service', service))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('detail', detail))..add(DiagnosticsProperty('link', link))..add(DiagnosticsProperty('provider', provider))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('benefits', benefits))..add(DiagnosticsProperty('cons', cons))..add(DiagnosticsProperty('useCases', useCases))..add(DiagnosticsProperty('example', example));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudData&&(identical(other.service, service) || other.service == service)&&(identical(other.description, description) || other.description == description)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.link, link) || other.link == link)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.benefits, benefits)&&const DeepCollectionEquality().equals(other.cons, cons)&&const DeepCollectionEquality().equals(other.useCases, useCases)&&(identical(other.example, example) || other.example == example));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,service,description,detail,link,provider,type,const DeepCollectionEquality().hash(benefits),const DeepCollectionEquality().hash(cons),const DeepCollectionEquality().hash(useCases),example);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CloudData(service: $service, description: $description, detail: $detail, link: $link, provider: $provider, type: $type, benefits: $benefits, cons: $cons, useCases: $useCases, example: $example)';
}


}

/// @nodoc
abstract mixin class $CloudDataCopyWith<$Res>  {
  factory $CloudDataCopyWith(CloudData value, $Res Function(CloudData) _then) = _$CloudDataCopyWithImpl;
@useResult
$Res call({
 String service, String description, String detail, String link, String provider, String type, List<String> benefits, List<String> cons, List<String> useCases, String example
});




}
/// @nodoc
class _$CloudDataCopyWithImpl<$Res>
    implements $CloudDataCopyWith<$Res> {
  _$CloudDataCopyWithImpl(this._self, this._then);

  final CloudData _self;
  final $Res Function(CloudData) _then;

/// Create a copy of CloudData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? service = null,Object? description = null,Object? detail = null,Object? link = null,Object? provider = null,Object? type = null,Object? benefits = null,Object? cons = null,Object? useCases = null,Object? example = null,}) {
  return _then(_self.copyWith(
service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,benefits: null == benefits ? _self.benefits : benefits // ignore: cast_nullable_to_non_nullable
as List<String>,cons: null == cons ? _self.cons : cons // ignore: cast_nullable_to_non_nullable
as List<String>,useCases: null == useCases ? _self.useCases : useCases // ignore: cast_nullable_to_non_nullable
as List<String>,example: null == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudData].
extension CloudDataPatterns on CloudData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudData value)  $default,){
final _that = this;
switch (_that) {
case _CloudData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudData value)?  $default,){
final _that = this;
switch (_that) {
case _CloudData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String service,  String description,  String detail,  String link,  String provider,  String type,  List<String> benefits,  List<String> cons,  List<String> useCases,  String example)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudData() when $default != null:
return $default(_that.service,_that.description,_that.detail,_that.link,_that.provider,_that.type,_that.benefits,_that.cons,_that.useCases,_that.example);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String service,  String description,  String detail,  String link,  String provider,  String type,  List<String> benefits,  List<String> cons,  List<String> useCases,  String example)  $default,) {final _that = this;
switch (_that) {
case _CloudData():
return $default(_that.service,_that.description,_that.detail,_that.link,_that.provider,_that.type,_that.benefits,_that.cons,_that.useCases,_that.example);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String service,  String description,  String detail,  String link,  String provider,  String type,  List<String> benefits,  List<String> cons,  List<String> useCases,  String example)?  $default,) {final _that = this;
switch (_that) {
case _CloudData() when $default != null:
return $default(_that.service,_that.description,_that.detail,_that.link,_that.provider,_that.type,_that.benefits,_that.cons,_that.useCases,_that.example);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudData with DiagnosticableTreeMixin implements CloudData {
  const _CloudData({required this.service, required this.description, required this.detail, required this.link, required this.provider, required this.type, required final  List<String> benefits, required final  List<String> cons, required final  List<String> useCases, required this.example}): _benefits = benefits,_cons = cons,_useCases = useCases;
  factory _CloudData.fromJson(Map<String, dynamic> json) => _$CloudDataFromJson(json);

@override final  String service;
@override final  String description;
@override final  String detail;
@override final  String link;
@override final  String provider;
@override final  String type;
 final  List<String> _benefits;
@override List<String> get benefits {
  if (_benefits is EqualUnmodifiableListView) return _benefits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_benefits);
}

 final  List<String> _cons;
@override List<String> get cons {
  if (_cons is EqualUnmodifiableListView) return _cons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cons);
}

 final  List<String> _useCases;
@override List<String> get useCases {
  if (_useCases is EqualUnmodifiableListView) return _useCases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_useCases);
}

@override final  String example;

/// Create a copy of CloudData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudDataCopyWith<_CloudData> get copyWith => __$CloudDataCopyWithImpl<_CloudData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudDataToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CloudData'))
    ..add(DiagnosticsProperty('service', service))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('detail', detail))..add(DiagnosticsProperty('link', link))..add(DiagnosticsProperty('provider', provider))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('benefits', benefits))..add(DiagnosticsProperty('cons', cons))..add(DiagnosticsProperty('useCases', useCases))..add(DiagnosticsProperty('example', example));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudData&&(identical(other.service, service) || other.service == service)&&(identical(other.description, description) || other.description == description)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.link, link) || other.link == link)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._benefits, _benefits)&&const DeepCollectionEquality().equals(other._cons, _cons)&&const DeepCollectionEquality().equals(other._useCases, _useCases)&&(identical(other.example, example) || other.example == example));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,service,description,detail,link,provider,type,const DeepCollectionEquality().hash(_benefits),const DeepCollectionEquality().hash(_cons),const DeepCollectionEquality().hash(_useCases),example);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CloudData(service: $service, description: $description, detail: $detail, link: $link, provider: $provider, type: $type, benefits: $benefits, cons: $cons, useCases: $useCases, example: $example)';
}


}

/// @nodoc
abstract mixin class _$CloudDataCopyWith<$Res> implements $CloudDataCopyWith<$Res> {
  factory _$CloudDataCopyWith(_CloudData value, $Res Function(_CloudData) _then) = __$CloudDataCopyWithImpl;
@override @useResult
$Res call({
 String service, String description, String detail, String link, String provider, String type, List<String> benefits, List<String> cons, List<String> useCases, String example
});




}
/// @nodoc
class __$CloudDataCopyWithImpl<$Res>
    implements _$CloudDataCopyWith<$Res> {
  __$CloudDataCopyWithImpl(this._self, this._then);

  final _CloudData _self;
  final $Res Function(_CloudData) _then;

/// Create a copy of CloudData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? service = null,Object? description = null,Object? detail = null,Object? link = null,Object? provider = null,Object? type = null,Object? benefits = null,Object? cons = null,Object? useCases = null,Object? example = null,}) {
  return _then(_CloudData(
service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,benefits: null == benefits ? _self._benefits : benefits // ignore: cast_nullable_to_non_nullable
as List<String>,cons: null == cons ? _self._cons : cons // ignore: cast_nullable_to_non_nullable
as List<String>,useCases: null == useCases ? _self._useCases : useCases // ignore: cast_nullable_to_non_nullable
as List<String>,example: null == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
