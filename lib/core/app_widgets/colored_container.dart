import 'package:flutter/material.dart';

class ColoredContainer extends StatelessWidget {
  final Widget child;
  final double padding;
  final Color color1;
  final Color color2;
  final double raduis;
  final DecorationImage? decorationImage;

  const ColoredContainer(
      {super.key,
      required this.padding,
      required this.child,
      this.raduis = 10,
      this.decorationImage,
      required this.color1,
      required this.color2});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [color1, color2],
          ),
          image: decorationImage,
          borderRadius: BorderRadius.circular(raduis)),
      child: child,
    );
  }
}
