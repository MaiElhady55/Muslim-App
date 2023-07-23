import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/app_widgets/custom_arrow_back.dart';
import 'package:muslim_app_2/core/app_widgets/custom_container.dart';
import 'package:muslim_app_2/core/utils/app_colors.dart';
import 'package:muslim_app_2/core/utils/app_images.dart';
import 'package:muslim_app_2/core/utils/styles.dart';
import 'package:muslim_app_2/features/asmaa_allah/data/models/asmaa_allah_elhosna.dart';
import 'package:muslim_app_2/features/asmaa_allah/presentation/views/widgets/awesome_dialog.dart';

class AsmaaAllahView extends StatelessWidget {
  const AsmaaAllahView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomContainer(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 11.95,
              child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    children: List.generate(
                        AsmaaAllahElHosna.name.length,
                        (index) => InkWell(
                              onTap: () {
                                awesomeDialog(
                                    context,
                                    AsmaaAllahElHosna.name[index],
                                    AsmaaAllahElHosna.meaning[index]);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        tileMode: TileMode.mirror,
                                        end: Alignment.center,
                                        colors: [
                                          AppColors.kBlueColor,
                                          Colors.lightGreen
                                        ]),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: .3,
                                    ),
                                    image: const DecorationImage(
                                        image: AssetImage(AppImages.pattern),
                                        opacity: 0.1),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(3, 3),
                                          blurRadius: 7)
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        AsmaaAllahElHosna.name[index],
                                        textAlign: TextAlign.center,
                                        style: Styles.textStyle30Ar,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                  )),
            ),
            const CustomArrowBack(),
          ],
        ),
      ),
    ));
  }
}
