class GregorianWeekday {
  String? en;

  GregorianWeekday({this.en});

  factory GregorianWeekday.fromJson(Map<String, dynamic> json) =>
      GregorianWeekday(
        en: json['en'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'en': en,
      };
}
