import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/app_widgets/custom_arrow_back.dart';
import 'package:muslim_app_2/core/app_widgets/custom_container.dart';
import 'package:muslim_app_2/core/data/data.dart';
import 'package:muslim_app_2/features/sunnah/presentation/views/widgets/sunnah_card.dart';

class SunnahView extends StatelessWidget {
  const SunnahView({super.key});

  @override
  Widget build(BuildContext context) {
    Map map = sunnah[0];
    return Scaffold(
        body: CustomContainer(
            child: SingleChildScrollView(
      child: Column(
        children: [
          const CustomArrowBack(),
          SizedBox(
              child: ListView.builder(
            padding: const EdgeInsets.all(10),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: map.length,
            itemBuilder: (context, indexi) {
              return SunnahCard(map: map, indexi: indexi);
            },
          ))
        ],
      ),
    )));
  }
}
