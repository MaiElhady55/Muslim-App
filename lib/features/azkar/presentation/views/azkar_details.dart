import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/app_widgets/custom_arrow_back.dart';
import 'package:muslim_app_2/core/app_widgets/custom_container.dart';
import 'package:muslim_app_2/core/data/data.dart';
import 'package:muslim_app_2/core/utils/styles.dart';
import 'package:muslim_app_2/features/azkar/presentation/views/widgets/azkar_card.dart';

class AzkarDetailsView extends StatelessWidget {
  final String name;

  const AzkarDetailsView({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomContainer(
            child: SingleChildScrollView(
      child: Column(
        children: [
          const CustomArrowBack(),
          AzkarCard(
            name: name,
            fun: null,
            color: const Color.fromARGB(255, 67, 67, 67),
            textColor: Colors.white,
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
              child: ListView.builder(
            itemCount: azkar[0][name]!.length,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
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
                    child: Text(
                      '${azkar[0][name]![index]['ARABIC_TEXT']}',
                      textDirection: TextDirection.rtl,
                      style: Styles.textStyle20Ar,
                    ),
                  )
                ],
              );
            },
          ))
        ],
      ),
    )));
  }
}
