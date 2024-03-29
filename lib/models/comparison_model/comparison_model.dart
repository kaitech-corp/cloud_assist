import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `comparison_model.dart` with the code generated by Freezed
part 'comparison_model.freezed.dart';
// optional: Since our ComparisonModel class is serializable, we must add this line.
// But if ComparisonModel was not serializable, we could skip it.
part 'comparison_model.g.dart';

///Model for database comparison

///Model for comparison data
class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp json) => json.toDate();

  @override
  Timestamp toJson(DateTime object) => Timestamp.fromDate(object);
}

class TimestampNullableConverter implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampNullableConverter();

  @override
  DateTime? fromJson(Timestamp? json) => json?.toDate();

  @override
  Timestamp? toJson(DateTime? object) =>
      object == null ? null : Timestamp.fromDate(object);
}

@freezed
class ComparisonModel with _$ComparisonModel {
  const factory ComparisonModel(
      {required String answer,
      required String docID,
      @TimestampConverter() DateTime?  timestamp,
      required List<Map<String, String>>answersSelected,
}) = _ComparisonModel;

  factory ComparisonModel.fromJson(Map<String, Object?> json) =>
      _$ComparisonModelFromJson(json);
}
