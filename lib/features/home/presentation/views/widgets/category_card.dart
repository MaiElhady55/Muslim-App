import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/functions/navigation.dart';
import 'package:muslim_app_2/core/utils/app_images.dart';
import 'package:muslim_app_2/core/utils/styles.dart';
import 'package:muslim_app_2/features/azkar/presentation/views/azkar_view.dart';
import 'package:muslim_app_2/features/hadith/presentation/views/hadith_view.dart';
import 'package:muslim_app_2/features/home/data/models/home_view_models/category_card_model.dart';
import 'package:muslim_app_2/features/pray_times/presentation/views/pray_times_view.dart';
import 'package:muslim_app_2/features/quran/presentation/views/quran_view.dart';
import 'package:muslim_app_2/features/stories/presentation/views/stories_view.dart';

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  CategoryCard({super.key});

  List<CategoryCardModel> catCardList = [
    CategoryCardModel(
      image: AppImages.hadith2,
      title: 'الاحاديث',
    ),
    CategoryCardModel(
      image: AppImages.time,
      title: 'مواقيت الصلاة',
    ),
    CategoryCardModel(
      image: AppImages.quran,
      title: 'القرآن',
    ),
    CategoryCardModel(
      image: AppImages.book,
      title: 'قصص الأنبياء',
    ),
    CategoryCardModel(
      image: AppImages.beads,
      title: 'أذكار وأدعية',
    ),
  ];
  List<Widget> pages = const [
    HadithView(),
    PrayTimesView(),
    QuranView(),
    StoriesView(),
    AzkarView(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: catCardList.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => navigateTo(context: context, router: pages[index]),
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(catCardList[index].image, height: 50),
                  Text(
                    catCardList[index].title,
                    style: Styles.textStyle15Ar,
                  ),
                ],
              )),
        );
      },
    );
  }
}
