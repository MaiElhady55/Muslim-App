class GregorianMonth {
  int? number;
  String? en;

  GregorianMonth({this.number, this.en});

  factory GregorianMonth.fromJson(Map<String, dynamic> json) => GregorianMonth(
        number: json['number'] as int?,
        en: json['en'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'en': en,
      };
}
