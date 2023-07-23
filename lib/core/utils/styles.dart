import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle textStyle30Ar =
      const TextStyle(fontSize: 30, fontFamily: 'Arabic');

  static TextStyle textStyle20Ar = const TextStyle(
    fontSize: 20,
    fontFamily: 'Arabic',
  );

  static TextStyle textStyle15Ar =
      const TextStyle(fontSize: 15, fontFamily: 'Arabic');

  static TextStyle textStyle12Ar =
      const TextStyle(color: Colors.white, fontSize: 12, fontFamily: 'Arabic');

  static TextStyle textStyle25Ar =
      const TextStyle(fontSize: 25, fontFamily: 'Arabic');

  static TextStyle textStyle18Ar =
      const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Arabic');

  static TextStyle textStyle40Ar =
      const TextStyle(fontSize: 40, fontFamily: 'Arabic');

  static TextStyle textStyleError(Color errorColor) => TextStyle(
      decoration: TextDecoration.none,
      color: errorColor,
      fontSize: 15,
      fontWeight: FontWeight.bold);

  static TextStyle textStyle36 = const TextStyle(
    fontSize: 36,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textStyle24 =
      const TextStyle(fontSize: 24, color: Colors.white);

  static TextStyle textStyle20 =
      const TextStyle(fontSize: 20, color: Colors.white);

  static TextStyle textStyle23 = const TextStyle(
    fontSize: 23,
    fontFamily: 'Amiri',
  );
}
