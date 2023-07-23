import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/app_widgets/custom_arrow_back.dart';
import 'package:muslim_app_2/core/app_widgets/custom_container.dart';
import 'package:muslim_app_2/features/home/presentation/view_models/providers/api_provider.dart';
import 'package:muslim_app_2/features/quran/presentation/views/widgets/verse_card.dart';
import 'package:provider/provider.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    var api = Provider.of<ApiProvider>(context);
    return Scaffold(
        body: FutureBuilder<Map>(
      future: api.getQuranData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // ignore: avoid_dynamic_calls
          List? quran = snapshot.data!['data']['surahs'];
          return CustomContainer(
              child: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              const CustomArrowBack(),
              SizedBox(
                  child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: quran?.length,
                itemBuilder: (context, index) {
                  // ignore: avoid_dynamic_calls
                  List<dynamic> ayahs = quran?[index]['ayahs'];
                  return VerseCard(
                      // ignore: avoid_dynamic_calls
                      name: quran?[index]['name'],
                      num: ayahs.length,
                      id: index);
                },
              ))
            ]),
          )));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
