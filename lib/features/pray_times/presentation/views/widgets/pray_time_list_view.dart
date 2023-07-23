import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/utils/app_images.dart';
import 'package:muslim_app_2/core/utils/styles.dart';
import 'package:muslim_app_2/features/home/data/models/prayertime/timings.model.dart';
import 'package:muslim_app_2/features/home/presentation/view_models/providers/provider.dart';
import 'package:muslim_app_2/features/pray_times/data/models/pray_time_model.dart';
import 'package:provider/provider.dart';

class PrayTimeListView extends StatelessWidget {
  final Timings timings;

  const PrayTimeListView({super.key, required this.timings});
  @override
  Widget build(BuildContext context) {
    var custom = Provider.of<CustomProvider>(context);
    List<PrayTimeModel> prayList = [
      PrayTimeModel(
          name: 'الفجر',
          time: custom.replaceNumber(custom.convertTime(timings.fajr)),
          image: AppImages.fajr),
      PrayTimeModel(
          name: 'الشروق',
          time: custom.replaceNumber(custom.convertTime(timings.sunrise)),
          image: AppImages.sunrise),
      PrayTimeModel(
          name: 'الظهر',
          time: custom.replaceNumber(custom.convertTime(timings.dhuhr)),
          image: AppImages.dhuhr),
      PrayTimeModel(
          name: 'العصر',
          time: custom.replaceNumber(custom.convertTime(timings.asr)),
          image: AppImages.asr),
      PrayTimeModel(
          name: 'المغرب',
          time: custom.replaceNumber(custom.convertTime(timings.maghrib)),
          image: AppImages.maghrib),
      PrayTimeModel(
          name: 'العشاء',
          time: custom.replaceNumber(custom.convertTime(timings.isha)),
          image: AppImages.ishaa),
    ];
    return SizedBox(
      child: ListView.builder(
        itemCount: prayList.length,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(prayList[index].time, style: Styles.textStyle25Ar),
                Row(
                  children: [
                    Text(prayList[index].name, style: Styles.textStyle25Ar),
                    const SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      prayList[index].image,
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
