import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/functions/navigation.dart';
import 'package:muslim_app_2/core/utils/styles.dart';
import 'package:muslim_app_2/features/setting/presentation/views/setting_view.dart';

class HomeNav extends StatelessWidget {
  const HomeNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            navigateTo(context: context, router: SettingView());
          },
          child: const Icon(
            Icons.settings,
            size: 26,
          ),
        ),
        Text(
          'مُسلِم',
          style: Styles.textStyle30Ar,
        )
      ],
    );
  }
}
