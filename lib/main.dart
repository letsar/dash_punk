// @dart=2.9

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/level_up_controller.dart';
import 'theme/colors.dart';
import 'ui/home/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dash Punk',
      theme: ThemeData(
        primaryColor: FlutterColors.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}
