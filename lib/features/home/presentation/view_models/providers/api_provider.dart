import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:muslim_app_2/features/home/data/models/prayertime/prayertime.model.dart';
import 'package:quran/quran.dart' as quran;

class ApiProvider extends ChangeNotifier {
  final String prayerUrl =
      'http://api.aladhan.com/v1/timingsByCity/05-07-2023?city=Cairo&country=Egypt&method=4';
  final String quranUrl = 'http://api.alquran.cloud/v1/quran/quran-uthmani';
  final String sabahUlr = 'http://www.hisnmuslim.com/api/ar/27.json';

  final Dio dio = Dio();

  Future<Data> getPrayData() async {
    Response response = await dio.get(prayerUrl);
    Data praylist = Data.fromJson(response.data);
    return praylist;
  }

  Future<Map<String, dynamic>> getQuranData() async {
    Response response = await dio.get(quranUrl);
    Map<String, dynamic> list = response.data;
    return list;
  }

  Future<Map> getAzkarData() async {
    Response response = await dio.get(sabahUlr);
    Map list = response.data;
    return list;
  }

  String sum(List sura, int num) {
    String sum = '';
    for (int i = 0; i < sura.length; i++) {
      sum = '$sum${quran.getVerse(
        num + 1,
        i + 1,
        verseEndSymbol: true,
      )} ';
    }
    return sum;
  }
}
