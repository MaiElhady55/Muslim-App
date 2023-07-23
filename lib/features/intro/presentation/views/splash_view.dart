import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/attention_seekers/rubber_band.dart';
import 'package:muslim_app_2/core/app_widgets/custom_container.dart';
import 'package:muslim_app_2/core/functions/navigation.dart';
import 'package:muslim_app_2/core/utils/app_colors.dart';
import 'package:muslim_app_2/core/utils/app_images.dart';
import 'package:muslim_app_2/core/utils/styles.dart';
import 'package:muslim_app_2/features/home/presentation/views/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        navigateAndFinsh(context: context, router: const HomeView());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainer(
        linearGradient: const LinearGradient(
          colors: [
            AppColors.kGradientColor2,
            AppColors.kGradientColor1,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        child: Center(
          child: RubberBand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.splash,
                  height: 200,
                ),
                Text(
                  'مُسلِم',
                  style: Styles.textStyle30Ar.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
