import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/utils/app_colors.dart';
import 'package:muslim_app_2/core/utils/app_images.dart';
import 'package:muslim_app_2/core/utils/size_config.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final Gradient? linearGradient;
  final Color? color;
  final double opacity;
  final String image;
  const CustomContainer({
    super.key,
    required this.child,
    this.opacity = .1,
    this.color,
    this.image = AppImages.pattern,
    this.linearGradient = const LinearGradient(
      colors: [AppColors.kGreenColor, AppColors.kBlueColor],
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
    ),
  });
  @override
  Widget build(BuildContext context) {
    var w = SizeConfig.width(context);
    var h = SizeConfig.height(context);
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
          gradient: linearGradient,
          color: color,
          image: DecorationImage(
              image: AssetImage(image),
              opacity: opacity,
              repeat: ImageRepeat.repeat)),
      child: child,
    );
  }
}
