import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `report_content_model.dart` with the code generated by Freezed
part 'report_content_model.freezed.dart';
// optional: Since our ReportContent class is serializable, we must add this line.
// But if ReportContent was not serializable, we could skip it.
part 'report_content_model.g.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp json) => json.toDate();

  @override
  Timestamp toJson(DateTime object) => Timestamp.fromDate(object);
}

class TimestampNullableConverter
    implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampNullableConverter();

  @override
  DateTime? fromJson(Timestamp? json) => json?.toDate();

  @override
  Timestamp? toJson(DateTime? object) =>
      object == null ? null : Timestamp.fromDate(object);
}

enum ReportType {
  outdated,
  inaccurate,
  incomplete,
  irrelevant,
  inappropriate
}

///Model for cloud data
@freezed
class ReportContent with _$ReportContent {
  const factory ReportContent({
    required String content,
    required String reportType,
    required String contentDocID,
    String? contentField,
    @TimestampConverter() DateTime? timestamp,
  }) = _ReportContent;

  factory ReportContent.fromJson(Map<String, Object?> json) =>
      _$ReportContentFromJson(json);
}

// flutter pub run build_runner build --delete-conflicting-outputs
