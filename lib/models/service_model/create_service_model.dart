import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_service_model.freezed.dart';
part 'create_service_model.g.dart';

@freezed
class ServiceModel with _$ServiceModel {
  const factory ServiceModel({
    String? category,
    String? description,
    List<Services>? services,
  }) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
}

@freezed
class Services with _$Services {
  const factory Services({
    String? service,
    String? description,
  }) = _Services;

  factory Services.fromJson(Map<String, dynamic> json) =>
      _$ServicesFromJson(json);
}
