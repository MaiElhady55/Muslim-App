import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/app_widgets/custom_arrow_back.dart';
import 'package:muslim_app_2/core/app_widgets/custom_container.dart';
import 'package:muslim_app_2/core/data/data.dart';
import 'package:muslim_app_2/core/functions/navigation.dart';
import 'package:muslim_app_2/features/azkar/presentation/views/azkar_details.dart';
import 'package:muslim_app_2/features/azkar/presentation/views/sabah_view.dart';
import 'package:muslim_app_2/features/azkar/presentation/views/widgets/azkar_card.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainer(
          child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomArrowBack(),
            AzkarCard(
              name: 'أذكار الصباح و المساء',
              fun: () {
                navigateTo(
                    context: context,
                    router: const SabahView(
                      name: 'أذكار الصباح و المساء',
                    ));
              },
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 1.15,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: azkar[0].keys.length,
                  itemBuilder: (context, index) {
                    return AzkarCard(
                      name: azkar[0].keys.elementAt(index),
                      fun: () {
                        navigateTo(
                            context: context,
                            router: AzkarDetailsView(
                                name: azkar[0].keys.elementAt(index)));
                      },
                    );
                  },
                ))
          ],
        ),
      )),
    );
  }
}
