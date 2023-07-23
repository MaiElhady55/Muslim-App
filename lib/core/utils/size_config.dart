import 'package:flutter/material.dart';

class SizeConfig {
  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static EdgeInsets padding10H(double h) =>
      EdgeInsets.symmetric(horizontal: h * 13.5 / 100);

  static EdgeInsets padding10V(double h) =>
      EdgeInsets.symmetric(vertical: h * 13.5 / 100);

  static EdgeInsets padding10HV(double h) => EdgeInsets.symmetric(
      horizontal: h * 13.5 / 100, vertical: h * 13.5 / 100);

  static EdgeInsets padding10V20H(double h) =>
      EdgeInsets.symmetric(vertical: h * 13.5 / 100, horizontal: h * 0.027);

  static EdgeInsets padding5V10H(double h) =>
      EdgeInsets.symmetric(vertical: h * 0.007, horizontal: h * 13.5 / 100);

  static EdgeInsets padding5All = const EdgeInsets.all(5);
  static EdgeInsets padding10All = const EdgeInsets.all(10);

  static SizedBox sizedBox20(double h) => SizedBox(height: h * 0.027);
}
