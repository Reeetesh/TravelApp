import 'package:flutter/material.dart';
import "package:get/get.dart";

import 'package:travelapp/views/home.dart';
import 'package:travelapp/views/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}
