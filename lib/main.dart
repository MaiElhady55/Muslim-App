import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/data/data.dart';
import 'package:muslim_app_2/core/database/sqldb.dart';
import 'package:muslim_app_2/features/asmaa_allah/data/models/asmaa_allah_elhosna.dart';
import 'package:muslim_app_2/features/home/presentation/view_models/providers/api_provider.dart';
import 'package:muslim_app_2/features/home/presentation/view_models/providers/provider.dart';
import 'package:muslim_app_2/features/intro/presentation/views/splash_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ApiProvider()),
    ChangeNotifierProvider(create: (context) => CustomProvider()),
  ], child: const MyApp()));
  Map<String, dynamic> json = jsonDecode(asmaaAllahElHosna);
  AsmaaAllahElHosna.fromJson(json);
  SqlDb().intialDb();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muslim App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashView(),
    );
  }
}
