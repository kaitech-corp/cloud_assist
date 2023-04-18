import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `cloud_data_model.dart` with the code generated by Freezed
part 'cloud_data_model.freezed.dart';
// optional: Since our CloudData class is serializable, we must add this line.
// But if CloudData was not serializable, we could skip it.
part 'cloud_data_model.g.dart';

///Model for cloud data
@freezed
class CloudData with _$CloudData {
  const factory CloudData(
      {required String service,
      required String description,
      required String detail,
      required String link,
      required String provider,
      required String type,
      required List<String> benefits,
      required List<String> cons,
      required List<String> useCases,
      required String example}) = _CloudData;

  factory CloudData.fromJson(Map<String, Object?> json) =>
      _$CloudDataFromJson(json);
}

CloudData defaultCloudData = const CloudData(
    service: 'Service',
    description: 'Description',
    detail: 'Details',
    link: 'Link',
    provider: 'Provider',
    type: 'Type',
    benefits: <String>['Benifits'],
    cons: <String>['Cons'],
    useCases: <String>['Use Cases'],
    example: 'Example');

    
// flutter pub run build_runner build --delete-conflicting-outputs
