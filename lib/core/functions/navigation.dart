import 'package:flutter/material.dart';

void navigateTo({required context, required router}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => router));

Future navigateAndFinsh(
        {required BuildContext context, required Widget router}) =>
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => router),
    );
