import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/app_widgets/colored_container.dart';
import 'package:muslim_app_2/core/functions/navigation.dart';
import 'package:muslim_app_2/core/utils/app_colors.dart';
import 'package:muslim_app_2/core/utils/size_config.dart';
import 'package:muslim_app_2/core/utils/styles.dart';
import 'package:muslim_app_2/features/stories/presentation/views/story_details.dart';

class StoryCard extends StatelessWidget {
  final String name;
  final String image;
  final int id;

  const StoryCard(
      {super.key, required this.name, required this.image, required this.id});
  @override
  Widget build(BuildContext context) {
    var w = SizeConfig.width(context);
    var h = SizeConfig.height(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          navigateTo(context: context, router: StoryDetails(id: id));
        },
        child: Container(
          width: w,
          height: h * .2,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
                opacity: .8),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ColoredContainer(
                  padding: 5,
                  color1: AppColors.kBlueColor,
                  color2: AppColors.kGreenColor,
                  child: Text(name,
                      style: Styles.textStyle20Ar.copyWith(fontSize: 25)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
