import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/utils/app_colors.dart';

class ColoredArrowBack extends StatelessWidget {
  const ColoredArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [AppColors.kGreenColor, AppColors.kBlueColor],
        ),
      ),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          iconSize: 25,
          color: Colors.white),
    );
  }
}
