import 'date.model.dart';
import 'meta.model.dart';
import 'timings.model.dart';

class DataClass {
  Timings? timings;
  Date? date;
  Meta? meta;

  DataClass({this.timings, this.date, this.meta});

  factory DataClass.fromJson(Map<String, dynamic> json) => DataClass(
        timings: json['timings'] == null
            ? null
            : Timings.fromJson(json['timings'] as Map<String, dynamic>),
        date: json['date'] == null
            ? null
            : Date.fromJson(json['date'] as Map<String, dynamic>),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'timings': timings?.toJson(),
        'date': date?.toJson(),
        'meta': meta?.toJson(),
      };
}
