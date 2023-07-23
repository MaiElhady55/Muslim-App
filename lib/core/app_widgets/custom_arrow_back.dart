import 'package:flutter/material.dart';

class CustomArrowBack extends StatelessWidget {
  final double padding;

  const CustomArrowBack({super.key, this.padding = 8});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.032, bottom: padding),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              iconSize: 25),
        ),
      ],
    );
  }
}
