import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `cloud_options_model.dart` with the code generated by Freezed
part 'cloud_options_model.freezed.dart';
// optional: Since our CloudOptions class is serializable, we must add this line.
// But if CloudOptions was not serializable, we could skip it.
part 'cloud_options_model.g.dart';

///Model for cloud data
@freezed
class CloudOptions with _$CloudOptions {
  const factory CloudOptions(
      {required String architecture,
      required String budget,
      required String dataAccessFrequency,
      required String dataConsistency,
      required String dataAccess,
      required String dataStorageType,
      required String dataSize,
            required String dataSecurity,
      required String dataGrowth,
      required String workload,}) = _CloudOptions;

  factory CloudOptions.fromJson(Map<String, Object?> json) =>
      _$CloudOptionsFromJson(json);
}

    
// flutter pub run build_runner build --delete-conflicting-outputs