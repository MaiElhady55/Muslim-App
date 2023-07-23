import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/app_widgets/custom_arrow_back.dart';
import 'package:muslim_app_2/core/app_widgets/custom_container.dart';
import 'package:muslim_app_2/core/utils/app_colors.dart';
import 'package:muslim_app_2/core/utils/styles.dart';
import 'package:muslim_app_2/features/home/data/models/prayertime/prayertime.model.dart';
import 'package:muslim_app_2/features/home/data/models/prayertime/timings.model.dart';
import 'package:muslim_app_2/features/home/presentation/view_models/providers/api_provider.dart';
import 'package:muslim_app_2/features/home/presentation/view_models/providers/provider.dart';
import 'package:muslim_app_2/features/pray_times/presentation/views/widgets/pray_time_list_view.dart';
import 'package:provider/provider.dart';

class PrayTimesView extends StatelessWidget {
  const PrayTimesView({super.key});

  @override
  Widget build(BuildContext context) {
    var api = Provider.of<ApiProvider>(context);
    var custom = Provider.of<CustomProvider>(context);
    return Scaffold(
        body: FutureBuilder<Data>(
      future: api.getPrayData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Timings? timings = snapshot.data?.data?.timings;
          return CustomContainer(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomArrowBack(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
                  decoration: BoxDecoration(
                      color: AppColors.kContainerColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/prayer.png',
                        height: 50,
                      ),
                      Column(
                        children: [
                          Text('   الصلاة القادمة',
                              style: Styles.textStyle18Ar),
                          Text(
                              custom.replaceNumber(custom.nextprayer(timings!)),
                              style: Styles.textStyle25Ar
                                  .copyWith(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: PrayTimeListView(timings: timings),
                ),
              ],
            ),
          ));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
