import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/app_widgets/colored_arrow_back.dart';
import 'package:muslim_app_2/core/app_widgets/colored_container.dart';
import 'package:muslim_app_2/core/app_widgets/custom_container.dart';
import 'package:muslim_app_2/core/data/data.dart';
import 'package:muslim_app_2/core/utils/app_colors.dart';
import 'package:muslim_app_2/core/utils/app_images.dart';
import 'package:muslim_app_2/core/utils/size_config.dart';
import 'package:muslim_app_2/core/utils/styles.dart';
import 'package:muslim_app_2/features/home/presentation/view_models/providers/provider.dart';
import 'package:muslim_app_2/features/tasbeh/presentation/views/widgets/tasbeh_container.dart';
import 'package:provider/provider.dart';

class TasbehView extends StatelessWidget {
  const TasbehView({super.key});

  @override
  Widget build(BuildContext context) {
    var custom = Provider.of<CustomProvider>(context);
    var w = SizeConfig.width(context);
    return Scaffold(
      body: CustomContainer(
        color: Colors.blue.withOpacity(.2),
        linearGradient: null,
        opacity: .2,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30, left: 18),
              child: Align(
                  alignment: Alignment.topLeft, child: ColoredArrowBack()),
            ),
            const SizedBox(
              height: 60,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: w * .22,
                  ),
                  for (int i = 0; i < tasbeh.length; i++)
                    Card(
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: ColoredContainer(
                          padding: 10,
                          color1: AppColors.G,
                          color2: AppColors.B,
                          raduis: 20,
                          decorationImage: const DecorationImage(
                              image: AssetImage(
                                AppImages.pattern,
                              ),
                              repeat: ImageRepeat.repeat,
                              opacity: .1),
                          child: Text(
                            // ignore: avoid_dynamic_calls
                            tasbeh[i]['title'],
                            style: Styles.textStyle40Ar,
                          )),
                    ),
                  SizedBox(
                    width: w * .15,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  AppImages.digital,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    TasbehContainer(
                      width: 140,
                      height: 50,
                      radius: 10,
                      child: Center(
                        child: Text(
                          custom.count.toString(),
                          style: Styles.textStyle40Ar.copyWith(fontFamily: ''),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 100),
                        GestureDetector(
                          onTap: () {
                            custom.reset();
                          },
                          child: const TasbehContainer(
                            width: 30,
                            height: 30,
                            child: Icon(
                              Icons.restart_alt,
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        custom.increasecount();
                      },
                      child: const TasbehContainer(
                          width: 60,
                          height: 60,
                          child: Icon(Icons.add, size: 40)),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
