import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `cloud_data_model.dart` with the code generated by Freezed
part 'quick_fact_model.freezed.dart';
// optional: Since our QuickFact class is serializable, we must add this line.
// But if QuickFact was not serializable, we could skip it.
part 'quick_fact_model.g.dart';

///Model for cloud data
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
class QuickFact with _$QuickFact {
  const factory QuickFact({
    required String fact,
    required String docID,
    required String service,
    required String flag,
    @TimestampConverter() DateTime?  timestamp,
  }) = _QuickFact;

  factory QuickFact.fromJson(Map<String, Object?> json) =>
      _$QuickFactFromJson(json);
}

QuickFact defaultQuickFact = QuickFact(
    fact: 'fact',
    docID: 'docID',
    service: 'service',
    flag: 'flag',
    timestamp: DateTime.now());
    
