import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/utils/styles.dart';

class CustomRow extends StatelessWidget {
  final String value;
  final String text;

  const CustomRow({super.key, required this.value, required this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(value, style: Styles.textStyle25Ar),
        Text(text, style: Styles.textStyle20Ar),
      ],
    );
  }
}
