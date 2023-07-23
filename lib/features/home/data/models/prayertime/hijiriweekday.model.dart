class HijriWeekday {
  String? en;
  String? ar;

  HijriWeekday({this.en, this.ar});

  factory HijriWeekday.fromJson(Map<String, dynamic> json) => HijriWeekday(
        en: json['en'] as String?,
        ar: json['ar'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'en': en,
        'ar': ar,
      };
}
