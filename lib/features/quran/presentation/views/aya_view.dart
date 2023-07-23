import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/app_widgets/custom_arrow_back.dart';
import 'package:muslim_app_2/core/app_widgets/custom_container.dart';
import 'package:muslim_app_2/core/utils/size_config.dart';
import 'package:muslim_app_2/core/utils/styles.dart';
import 'package:muslim_app_2/features/home/presentation/view_models/providers/api_provider.dart';
import 'package:provider/provider.dart';

class AyaView extends StatelessWidget {
  final String name;
  final int id;

  const AyaView({super.key, required this.name, required this.id});
  @override
  Widget build(BuildContext context) {
    var w = SizeConfig.width(context);
    var api = Provider.of<ApiProvider>(context);
    return Scaffold(
        body: FutureBuilder<Map>(
      future: api.getQuranData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // ignore: avoid_dynamic_calls
          List? verses = snapshot.data!['data']['surahs'];
          return CustomContainer(
              child: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              const CustomArrowBack(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 67, 67, 67),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ignore: avoid_dynamic_calls
                    Text('${snapshot.data!['data']['surahs'][id]['number']} ',
                        style: Styles.textStyle18Ar),
                    // ignore: avoid_dynamic_calls
                    Text(name, style: Styles.textStyle18Ar),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                width: w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    // ignore: avoid_dynamic_calls
                    (snapshot.data!['data']['surahs'][id]['ayahs'][id]
                                ['text'] ==
                            'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ')
                        ? Container()
                        : Column(
                            children: [
                              SizedBox(
                                width: w,
                                child: Text(
                                    'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ',
                                    textAlign: TextAlign.center,
                                    style: Styles.textStyle25Ar
                                        .copyWith(fontFamily: 'Amiri')),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                    Text(
                        api.sum(
                            // ignore: avoid_dynamic_calls
                            verses?[id]['ayahs']!,
                            id),
                        textAlign: TextAlign.end,
                        style:
                            Styles.textStyle25Ar.copyWith(fontFamily: 'Amiri')),
                  ],
                ),
              ),
            ]),
          )));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
