import 'dart:convert';

import 'data.model.dart';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  int? code;
  String? status;
  DataClass? data;

  Data({this.code, this.status, this.data});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        code: json['code'] as int?,
        status: json['status'] as String?,
        data: json['data'] == null
            ? null
            : DataClass.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'data': data?.toJson(),
      };
}
