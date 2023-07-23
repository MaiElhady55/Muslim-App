import 'package:flutter/material.dart';

class HadithArroeBack extends StatelessWidget {
  const HadithArroeBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.045, left: 12),
      child: Align(
          alignment: Alignment.topLeft,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 25,
            ),
          )),
    );
  }
}
