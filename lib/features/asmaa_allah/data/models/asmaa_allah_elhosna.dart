// ignore_for_file: avoid_dynamic_calls

class AsmaaAllahElHosna {
  static List<String> name = [];
  static List<String> meaning = [];
  AsmaaAllahElHosna.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((dynamic el) {
      name.add(el['name']);
      meaning.add(el['text']);
    });
  }
}
