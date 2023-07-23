import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/utils/styles.dart';

class LocationErrorWidget extends StatelessWidget {
  final String error;
  final Function? callback;

  const LocationErrorWidget(
      {Key? key, required this.error, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const box = SizedBox(height: 32);
    const errorColor = Color(0xffb00020);

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.location_off,
              size: 150,
              color: errorColor,
            ),
            box,
            Text(
              error,
              style: Styles.textStyleError(errorColor),
            ),
            box,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: const Text("Retry"),
                  onPressed: () {
                    if (callback != null) {
                      // ignore: avoid_dynamic_calls
                      callback!();
                    }
                  },
                ),
                ElevatedButton(
                  child: const Text("Back"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
