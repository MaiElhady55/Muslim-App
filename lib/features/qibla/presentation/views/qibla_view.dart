import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_app_2/core/app_widgets/black_container.dart';
import 'package:muslim_app_2/core/app_widgets/custom_arrow_back.dart';
import 'package:muslim_app_2/core/app_widgets/custom_container.dart';
import 'package:muslim_app_2/features/qibla/presentation/views/widgets/location_error_widget.dart';
import 'package:muslim_app_2/features/qibla/presentation/views/widgets/qibla_compass_widget.dart';

class QiblaView extends StatefulWidget {
  const QiblaView({super.key});

  @override
  State<QiblaView> createState() => _QiblaViewState();
}

class _QiblaViewState extends State<QiblaView> {
  // ignore: close_sinks
  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();

  Stream<LocationStatus> get stream => _locationStreamController.stream;

  Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else {
      _locationStreamController.sink.add(locationStatus);
    }
  }

  @override
  void initState() {
    _checkLocationStatus();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _locationStreamController.close();
    FlutterQiblah().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: stream,
            builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data?.enabled == true) {
                switch (snapshot.data?.status) {
                  case LocationPermission.always:
                  case LocationPermission.whileInUse:
                    return const CustomContainer(
                        child: Column(
                      children: [
                        CustomArrowBack(),
                        SizedBox(height: 20),
                        BlackContainer(
                            icon: Icons.compass_calibration,
                            text: 'إتجاه القبلة'),
                        SizedBox(height: 40),
                        QiblahCompassWidget(),
                      ],
                    ));
                  case LocationPermission.denied:
                    return LocationErrorWidget(
                      error: "Location service permission denied",
                      callback: _checkLocationStatus,
                    );
                  case LocationPermission.deniedForever:
                    return LocationErrorWidget(
                      error: "Location service Denied Forever !",
                      callback: _checkLocationStatus,
                    );
                  // case GeolocationStatus.unknown:
                  //   return LocationErrorWidget(
                  //     error: "Unknown Location service error",
                  //     callback: _checkLocationStatus,
                  //   );
                  default:
                    return Container();
                }
              } else {
                return LocationErrorWidget(
                  error: "Please enable Location service",
                  callback: _checkLocationStatus,
                );
              }
            }));
  }
}
