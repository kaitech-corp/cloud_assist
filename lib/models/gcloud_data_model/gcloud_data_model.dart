import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `gcloud_data_model.dart` with the code generated by Freezed
part 'gcloud_data_model.freezed.dart';
// optional: Since our GCloudData class is serializable, we must add this line.
// But if GCloudData was not serializable, we could skip it.
part 'gcloud_data_model.g.dart';

///Model for gcloud data
@freezed
class GCloudData with _$GCloudData {
  const factory GCloudData({
    required String topic,
    required String title,
    required Map<String,String> commands,
  }) = _GCloudData;

  factory GCloudData.fromJson(Map<String, Object?> json)
  => _$GCloudDataFromJson(json);
}

// GCloudData defaultGCloudData = const GCloudData(
//     topic:'Topic',
//     description:'Description',
//     detail:'Details',
//     benefits:['Benifits'],
//     cons:['Cons'],
//     useCases:['Use Cases'],
//     example:'Example'
// );
