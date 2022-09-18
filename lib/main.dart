import 'package:flutter/material.dart';
import 'package:medicine_info/data/medicine_data.dart';
import 'package:medicine_info/medicine_home/medicine_home.dart';
import 'package:medicine_info/models/medicine_model.dart';
import 'package:medicine_info/styles/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      for (Medicine menuItem in MedicinesData.medicineMenu) {
        precacheImage(Image.asset(menuItem.image).image, context);
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemes.main(),
      home: MedicineScreen(),
    );
  }
}
