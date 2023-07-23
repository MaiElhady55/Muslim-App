import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/app_widgets/custom_arrow_back.dart';
import 'package:muslim_app_2/core/app_widgets/custom_container.dart';
import 'package:muslim_app_2/core/data/data.dart';
import 'package:muslim_app_2/features/stories/presentation/views/widgets/story_card.dart';

class StoriesView extends StatelessWidget {
  const StoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomContainer(
            child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomArrowBack(),
          SizedBox(
              height: MediaQuery.of(context).size.height * 1.37,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: islamStories.length,
                itemBuilder: (context, index) {
                  return StoryCard(
                      name: islamStories[index]['title'] ?? '',
                      image: islamStories[index]['image'] ?? '',
                      id: index);
                },
              ))
        ],
      ),
    )));
  }
}
