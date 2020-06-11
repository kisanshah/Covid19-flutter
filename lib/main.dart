import 'package:covid_updates/data.dart';
import 'package:covid_updates/pages/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: accent),
    debugShowCheckedModeBanner: false,
    home: SafeArea(child: HomePage()),
  ));
}
