import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/functions/navigation.dart';
import 'package:muslim_app_2/core/utils/styles.dart';
import 'package:muslim_app_2/features/quran/presentation/views/aya_view.dart';

class VerseCard extends StatelessWidget {
  final String name;
  final int num;
  final int id;

  const VerseCard(
      {super.key, required this.name, required this.num, required this.id});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(
            context: context,
            router: AyaView(
              name: name,
              id: id,
            ));
      },
      child: Container(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 8),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('آيه ($num)', style: Styles.textStyle23),
            Text(name, style: Styles.textStyle23.copyWith(fontSize: 25)),
          ],
        ),
      ),
    );
  }
}
