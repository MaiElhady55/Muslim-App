import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/app_widgets/custom_arrow_back.dart';
import 'package:muslim_app_2/core/app_widgets/custom_container.dart';
import 'package:muslim_app_2/core/utils/app_images.dart';
import 'package:muslim_app_2/features/hadith/presentation/views/widgets/hadith_title.dart';
import 'package:muslim_app_2/features/home/presentation/view_models/providers/provider.dart';
import 'package:provider/provider.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key});

  @override
  Widget build(BuildContext context) {
    var custom = Provider.of<CustomProvider>(context);
    if (custom.allHadithList.isEmpty) custom.loadHadithFile();
    return Scaffold(
      body: Stack(
        children: [
          CustomContainer(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Transform.scale(
                  scale: 0.7,
                  child: Image.asset(
                    AppImages.hadith,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (_, index) {
                      return HadithTitle(custom.allHadithList[index]);
                    },
                    itemCount: custom.allHadithList.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 3.0,
                          color: Colors.white);
                    },
                  ),
                )
              ],
            ),
          )),
          const CustomArrowBack(),
        ],
      ),
    );
  }
}
