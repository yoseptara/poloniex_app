
import 'package:json_annotation/json_annotation.dart';

class DateTimeFromJsonConverter implements JsonConverter<DateTime, dynamic> {
  const DateTimeFromJsonConverter() : super();

  @override
  DateTime fromJson(dynamic json) {
    if (json != null) {
      if (json is String) {
        return DateTime.parse(json);
      } else if (json is int) {
        final DateTime filledDateTime = DateTime.fromMicrosecondsSinceEpoch(
          json ~/ 1000, isUtc: true,);
        return filledDateTime;
      } else {
        throw ('unknown json value in DateTimeFromJsonConverter');
      }
    } else {
      throw ('json value in DateTimeFromJsonConverter is null');
      // return null;
    }
  }

  @override
  dynamic toJson(DateTime object) => object.toIso8601String();
}