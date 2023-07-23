import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/app_widgets/black_container.dart';
import 'package:muslim_app_2/core/app_widgets/custom_arrow_back.dart';
import 'package:muslim_app_2/core/app_widgets/custom_container.dart';
import 'package:muslim_app_2/features/hijri/presentation/views/widgets/custom_divider.dart';
import 'package:muslim_app_2/features/hijri/presentation/views/widgets/custom_row.dart';
import 'package:muslim_app_2/features/home/data/models/prayertime/hijri.model.dart';
import 'package:muslim_app_2/features/home/presentation/view_models/providers/api_provider.dart';
import 'package:provider/provider.dart';

class HijriView extends StatelessWidget {
  const HijriView({super.key});

  @override
  Widget build(BuildContext context) {
    var api = Provider.of<ApiProvider>(context);
    return Scaffold(
        body: FutureBuilder(
      future: api.getPrayData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Hijri? hijri = snapshot.data?.data?.date?.hijri;
          return CustomContainer(
              child: Column(
            children: [
              const CustomArrowBack(),
              const SizedBox(height: 10),
              const BlackContainer(
                text: 'التاريخ الهجري',
                icon: Icons.calendar_today_outlined,
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    CustomRow(value: hijri?.date ?? '', text: ' : التاريخ'),
                    const CustomDivider(),
                    CustomRow(
                        value: hijri?.weekday?.ar ?? '', text: ' : اليوم'),
                    const CustomDivider(),
                    CustomRow(value: hijri?.month?.ar ?? '', text: ' : الشهر')
                  ],
                ),
              )
            ],
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
