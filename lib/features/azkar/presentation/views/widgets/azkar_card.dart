import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/utils/styles.dart';

class AzkarCard extends StatelessWidget {
  final String name;
  final void Function()? fun;
  final Color color;
  final Color textColor;

  const AzkarCard(
      {super.key,
      required this.name,
      required this.fun,
      this.color = Colors.white,
      this.textColor = Colors.black});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: fun,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(name,
                  style: Styles.textStyle20Ar.copyWith(color: textColor)),
            ],
          ),
        ),
      ),
    );
  }
}
