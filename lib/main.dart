import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reversi/pages/MenuPage.dart';
void main() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, 
    DeviceOrientation.portraitDown
  ]);
  await SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(
    MaterialApp(
      title: 'Reversi',
      home: MenuPage(),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
    )
  );
}