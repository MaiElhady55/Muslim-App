import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/app_widgets/custom_arrow_back.dart';
import 'package:muslim_app_2/core/app_widgets/custom_container.dart';
import 'package:muslim_app_2/core/utils/styles.dart';
import 'package:muslim_app_2/features/azkar/presentation/views/widgets/azkar_card.dart';
import 'package:muslim_app_2/features/hadith/data/models/hadith_details.dart';

class HadithDetailsView extends StatelessWidget {
  final HadithDetails hadith;

  const HadithDetailsView({super.key, required this.hadith});
  @override
  Widget build(BuildContext context) {
    int index = hadith.content.indexOf('(');
    String beganText = hadith.content.substring(0, index);
    String hadithContent = hadith.content.substring(index + 1);
    return Scaffold(
      body: CustomContainer(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomArrowBack(),
            AzkarCard(
              name: hadith.title,
              fun: null,
              color: const Color.fromARGB(255, 67, 67, 67),
              textColor: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
                child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        beganText,
                        style:
                            Styles.textStyle20Ar.copyWith(color: Colors.blue),
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '($hadithContent',
                        textDirection: TextDirection.rtl,
                        style: Styles.textStyle20Ar,
                      ),
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      )),
    );
  }
}
