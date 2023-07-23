class HijriMonth {
  int? number;
  String? en;
  String? ar;

  HijriMonth({this.number, this.en, this.ar});

  factory HijriMonth.fromJson(Map<String, dynamic> json) => HijriMonth(
        number: json['number'] as int?,
        en: json['en'] as String?,
        ar: json['ar'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'en': en,
        'ar': ar,
      };
}
