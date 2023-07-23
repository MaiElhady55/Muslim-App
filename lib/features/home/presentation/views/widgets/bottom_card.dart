import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/functions/navigation.dart';
import 'package:muslim_app_2/core/utils/app_images.dart';
import 'package:muslim_app_2/core/utils/styles.dart';
import 'package:muslim_app_2/features/asmaa_allah/presentation/views/asmaa_allah_view.dart';
import 'package:muslim_app_2/features/hijri/presentation/views/hijri_view.dart';
import 'package:muslim_app_2/features/home/data/models/home_view_models/botttom_card_model.dart';
import 'package:muslim_app_2/features/qibla/presentation/views/qibla_view.dart';
import 'package:muslim_app_2/features/sunnah/presentation/views/sunnah_view.dart';
import 'package:muslim_app_2/features/tasbeh/presentation/views/tasbeh_view.dart';

// ignore: must_be_immutable
class BottomCard extends StatelessWidget {
  BottomCard({super.key});

  List<BottomCardModel> bottomCardList = [
    BottomCardModel(
      image: AppImages.hegry,
      title: 'التاريخ الهجري',
      color1: Colors.lime,
      color2: Colors.limeAccent,
    ),
    BottomCardModel(
      image: AppImages.snn,
      title: 'سُنَن الرسول',
      color1: Colors.green,
      color2: const Color.fromARGB(255, 52, 120, 55),
    ),
    BottomCardModel(
      image: AppImages.tasbih,
      title: 'تسبيح',
      color1: const Color.fromARGB(255, 144, 194, 235),
      color2: const Color.fromARGB(255, 74, 121, 202),
    ),
    BottomCardModel(
      image: AppImages.qibla,
      title: 'القبلة',
      color1: Colors.red,
      color2: Colors.redAccent,
    ),
    BottomCardModel(
      image: AppImages.allah2,
      title: 'اسماء الله الحسني',
      color1: Colors.orange,
      color2: Colors.orangeAccent,
    ),
  ];
  List<Widget> pages = const [
    HijriView(),
    SunnahView(),
    TasbehView(),
    QiblaView(),
    AsmaaAllahView()
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: bottomCardList.length,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => navigateTo(context: context, router: pages[index]),
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                      AppImages.pattern,
                    ),
                    repeat: ImageRepeat.repeat,
                    scale: 2,
                    opacity: .2),
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    bottomCardList[index].color1,
                    bottomCardList[index].color2,
                  ],
                ),
                borderRadius: BorderRadius.circular(20)),
            width: width * .38,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(bottomCardList[index].image, height: height * .10),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      bottomCardList[index].title,
                      style: Styles.textStyle20Ar,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
