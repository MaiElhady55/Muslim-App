import 'package:flutter/material.dart';

class TasbehContainer extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final Widget child;

  const TasbehContainer(
      {super.key,
      required this.height,
      required this.width,
      this.radius = 50,
      required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 1,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: child);
  }
}
