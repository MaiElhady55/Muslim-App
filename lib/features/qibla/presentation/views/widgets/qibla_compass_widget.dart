import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:muslim_app_2/core/utils/app_images.dart';

class QiblahCompassWidget extends StatelessWidget {
  const QiblahCompassWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StreamBuilder(
        stream: FlutterQiblah.qiblahStream,
        builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          final qiblahDirection = snapshot.data;
          var angle = ((qiblahDirection!.qiblah) * (pi / 180) * -1);

          //if (angle < 5 && angle > -5) print('IN RANGE');

          return Transform.rotate(
            angle: angle,
            child: Image.asset(AppImages.dir),
          );
        },
      ),
    );
  }
}
