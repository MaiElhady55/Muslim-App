import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/functions/navigation.dart';
import 'package:muslim_app_2/core/utils/styles.dart';
import 'package:muslim_app_2/features/hadith/data/models/hadith_details.dart';
import 'package:muslim_app_2/features/hadith/presentation/views/hadith_details_view.dart';

class HadithTitle extends StatelessWidget {
  final HadithDetails hadith;
  const HadithTitle(this.hadith, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context: context, router: HadithDetailsView(hadith: hadith));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        alignment: Alignment.center,
        child: Text(hadith.title,
            textAlign: TextAlign.center, style: Styles.textStyle30Ar),
      ),
    );
  }
}
