import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/app_widgets/colored_arrow_back.dart';
import 'package:muslim_app_2/core/app_widgets/colored_container.dart';
import 'package:muslim_app_2/core/data/data.dart';
import 'package:muslim_app_2/core/utils/app_colors.dart';
import 'package:muslim_app_2/core/utils/size_config.dart';
import 'package:muslim_app_2/core/utils/styles.dart';

class StoryDetails extends StatelessWidget {
  final int id;
  const StoryDetails({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = SizeConfig.height(context);
    double w = SizeConfig.width(context);
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(children: [
      SizedBox(
        width: w,
        height: h * .35,
        child: Image.asset(islamStories[id]['image'], fit: BoxFit.cover),
      ),
      const Positioned(top: 25, left: 10, child: ColoredArrowBack()),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        margin: EdgeInsets.only(top: h * .3),
        width: w,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ColoredContainer(
              padding: 10,
              color1: AppColors.kGreenColor,
              color2: AppColors.kBlueColor,
              child: Text(
                islamStories[id]['title'],
                style: Styles.textStyle20Ar.copyWith(fontSize: 25),
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              islamStories[id]['content'],
              style: Styles.textStyle20Ar.copyWith(fontSize: 25),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    ])));
  }
}
