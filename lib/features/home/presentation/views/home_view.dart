import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:muslim_app_2/features/home/data/models/prayertime/prayertime.model.dart';
import 'package:muslim_app_2/features/home/data/models/prayertime/timings.model.dart';
import 'package:muslim_app_2/features/home/presentation/view_models/providers/api_provider.dart';
import 'package:muslim_app_2/features/home/presentation/view_models/providers/provider.dart';
import 'package:muslim_app_2/core/utils/app_colors.dart';
import 'package:muslim_app_2/core/utils/app_images.dart';
import 'package:muslim_app_2/core/utils/size_config.dart';
import 'package:muslim_app_2/core/utils/styles.dart';
import 'package:muslim_app_2/features/home/presentation/views/widgets/bottom_card.dart';
import 'package:muslim_app_2/features/home/presentation/views/widgets/category_card.dart';
import 'package:muslim_app_2/features/home/presentation/views/widgets/home_nav.dart';
import 'package:muslim_app_2/features/home/presentation/views/widgets/today_message.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var h = SizeConfig.height(context);
    var custom = Provider.of<CustomProvider>(context);
    var api = Provider.of<ApiProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: h * 0.044,
          ),
          BounceInDown(
              child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: HomeNav(),
          )),
          const Spacer(
            flex: 2,
          ),
          BounceIn(
              child: FutureBuilder<Data>(
                  future: api.getPrayData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Timings? time = snapshot.data?.data?.timings;
                      int end = custom
                              .convertDateTime(custom.nextprayerDate(time!))
                              .millisecondsSinceEpoch +
                          (1000 * 30) +
                          086390000;
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(h * 0.020),
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(
                                  AppImages.pattern,
                                ),
                                repeat: ImageRepeat.repeat,
                                opacity: .1),
                            gradient: const LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                AppColors.kGradientColor1,
                                AppColors.kGradientColor2
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CountdownTimer(
                                endTime: end,
                                widgetBuilder: (context, end) {
                                  if (end != null) {
                                    return Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Text(
                                                    custom.replaceNumber(
                                                        end.sec.toString()),
                                                    style:
                                                        Styles.textStyle15Ar)),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text('ثانية',
                                                style: Styles.textStyle12Ar),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Column(children: [
                                          Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                  custom.replaceNumber(
                                                      end.min.toString()),
                                                  style: Styles.textStyle15Ar)),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text('دقيقة',
                                              style: Styles.textStyle12Ar),
                                        ]),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                  (end.hours == null)
                                                      ? custom
                                                          .replaceNumber('0')
                                                      : custom.replaceNumber(
                                                          end.hours.toString()),
                                                  style: Styles.textStyle15Ar),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text('ساعه',
                                                style: Styles.textStyle12Ar),
                                          ],
                                        ),
                                      ],
                                    );
                                  } else {
                                    return
                                        // NotificationService().showNotification(
                                        //     1,
                                        //     custom.replaceNumber(
                                        //         custom.nextprayer(time)),
                                        //     'حان وقت الصلاة',
                                        //     5);
                                        Text('حان وقت الصلاة',
                                            style: Styles.textStyle12Ar);
                                  }
                                },
                              ),
                              Column(
                                children: [
                                  Text('   الصلاة القادمة',
                                      style: Styles.textStyle12Ar
                                          .copyWith(fontSize: 18)),
                                  Text(
                                      custom.replaceNumber(
                                          custom.nextprayer(time)),
                                      style: Styles.textStyle12Ar
                                          .copyWith(fontSize: 20)),
                                ],
                              ),
                            ]),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  })),
          const Spacer(
            flex: 2,
          ),
          BounceInLeft(
            child: SizedBox(height: h * 0.1, child: CategoryCard()),
          ),
          const Spacer(
            flex: 2,
          ),
          BounceInRight(child: const TodayMessage()),
          const Spacer(
            flex: 2,
          ),
          BounceInUp(
              child: SizedBox(
            height: 180,
            child: BottomCard(),
          )),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
