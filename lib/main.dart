import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'module1/screens/bottomNavigation/mainhomescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Intertoons',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MainHomeScreen(),
    );
  }
}
