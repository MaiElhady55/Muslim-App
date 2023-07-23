import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/utils/app_colors.dart';
import 'package:muslim_app_2/core/utils/styles.dart';

class BlackContainer extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Color color;
  final Color textColor;
  final Color iconColor;
  final double fontSize;

  const BlackContainer(
      {super.key,
      this.icon,
      required this.text,
      this.textColor = Colors.white,
      this.fontSize = 18,
      this.iconColor = Colors.white,
      this.color = AppColors.kContainerColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            size: 25,
            color: iconColor,
          ),
          Text(text,
              style: Styles.textStyle18Ar
                  .copyWith(color: textColor, fontSize: fontSize)),
        ],
      ),
    );
  }
}
