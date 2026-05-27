// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceModel {

 String? get category; String? get description; List<Services>? get services;
/// Create a copy of ServiceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceModelCopyWith<ServiceModel> get copyWith => _$ServiceModelCopyWithImpl<ServiceModel>(this as ServiceModel, _$identity);

  /// Serializes this ServiceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceModel&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.services, services));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,description,const DeepCollectionEquality().hash(services));

@override
String toString() {
  return 'ServiceModel(category: $category, description: $description, services: $services)';
}


}

/// @nodoc
abstract mixin class $ServiceModelCopyWith<$Res>  {
  factory $ServiceModelCopyWith(ServiceModel value, $Res Function(ServiceModel) _then) = _$ServiceModelCopyWithImpl;
@useResult
$Res call({
 String? category, String? description, List<Services>? services
});




}
/// @nodoc
class _$ServiceModelCopyWithImpl<$Res>
    implements $ServiceModelCopyWith<$Res> {
  _$ServiceModelCopyWithImpl(this._self, this._then);

  final ServiceModel _self;
  final $Res Function(ServiceModel) _then;

/// Create a copy of ServiceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = freezed,Object? description = freezed,Object? services = freezed,}) {
  return _then(_self.copyWith(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,services: freezed == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<Services>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceModel].
extension ServiceModelPatterns on ServiceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? category,  String? description,  List<Services>? services)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceModel() when $default != null:
return $default(_that.category,_that.description,_that.services);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? category,  String? description,  List<Services>? services)  $default,) {final _that = this;
switch (_that) {
case _ServiceModel():
return $default(_that.category,_that.description,_that.services);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? category,  String? description,  List<Services>? services)?  $default,) {final _that = this;
switch (_that) {
case _ServiceModel() when $default != null:
return $default(_that.category,_that.description,_that.services);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceModel implements ServiceModel {
  const _ServiceModel({this.category, this.description, final  List<Services>? services}): _services = services;
  factory _ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);

@override final  String? category;
@override final  String? description;
 final  List<Services>? _services;
@override List<Services>? get services {
  final value = _services;
  if (value == null) return null;
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ServiceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceModelCopyWith<_ServiceModel> get copyWith => __$ServiceModelCopyWithImpl<_ServiceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceModel&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._services, _services));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,description,const DeepCollectionEquality().hash(_services));

@override
String toString() {
  return 'ServiceModel(category: $category, description: $description, services: $services)';
}


}

/// @nodoc
abstract mixin class _$ServiceModelCopyWith<$Res> implements $ServiceModelCopyWith<$Res> {
  factory _$ServiceModelCopyWith(_ServiceModel value, $Res Function(_ServiceModel) _then) = __$ServiceModelCopyWithImpl;
@override @useResult
$Res call({
 String? category, String? description, List<Services>? services
});




}
/// @nodoc
class __$ServiceModelCopyWithImpl<$Res>
    implements _$ServiceModelCopyWith<$Res> {
  __$ServiceModelCopyWithImpl(this._self, this._then);

  final _ServiceModel _self;
  final $Res Function(_ServiceModel) _then;

/// Create a copy of ServiceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = freezed,Object? description = freezed,Object? services = freezed,}) {
  return _then(_ServiceModel(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,services: freezed == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<Services>?,
  ));
}


}


/// @nodoc
mixin _$Services {

 String? get service; String? get description;
/// Create a copy of Services
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServicesCopyWith<Services> get copyWith => _$ServicesCopyWithImpl<Services>(this as Services, _$identity);

  /// Serializes this Services to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Services&&(identical(other.service, service) || other.service == service)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,service,description);

@override
String toString() {
  return 'Services(service: $service, description: $description)';
}


}

/// @nodoc
abstract mixin class $ServicesCopyWith<$Res>  {
  factory $ServicesCopyWith(Services value, $Res Function(Services) _then) = _$ServicesCopyWithImpl;
@useResult
$Res call({
 String? service, String? description
});




}
/// @nodoc
class _$ServicesCopyWithImpl<$Res>
    implements $ServicesCopyWith<$Res> {
  _$ServicesCopyWithImpl(this._self, this._then);

  final Services _self;
  final $Res Function(Services) _then;

/// Create a copy of Services
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? service = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
service: freezed == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Services].
extension ServicesPatterns on Services {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Services value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Services() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Services value)  $default,){
final _that = this;
switch (_that) {
case _Services():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Services value)?  $default,){
final _that = this;
switch (_that) {
case _Services() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? service,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Services() when $default != null:
return $default(_that.service,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? service,  String? description)  $default,) {final _that = this;
switch (_that) {
case _Services():
return $default(_that.service,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? service,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _Services() when $default != null:
return $default(_that.service,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Services implements Services {
  const _Services({this.service, this.description});
  factory _Services.fromJson(Map<String, dynamic> json) => _$ServicesFromJson(json);

@override final  String? service;
@override final  String? description;

/// Create a copy of Services
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServicesCopyWith<_Services> get copyWith => __$ServicesCopyWithImpl<_Services>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServicesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Services&&(identical(other.service, service) || other.service == service)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,service,description);

@override
String toString() {
  return 'Services(service: $service, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ServicesCopyWith<$Res> implements $ServicesCopyWith<$Res> {
  factory _$ServicesCopyWith(_Services value, $Res Function(_Services) _then) = __$ServicesCopyWithImpl;
@override @useResult
$Res call({
 String? service, String? description
});




}
/// @nodoc
class __$ServicesCopyWithImpl<$Res>
    implements _$ServicesCopyWith<$Res> {
  __$ServicesCopyWithImpl(this._self, this._then);

  final _Services _self;
  final $Res Function(_Services) _then;

/// Create a copy of Services
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? service = freezed,Object? description = freezed,}) {
  return _then(_Services(
service: freezed == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
