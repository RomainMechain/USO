import 'package:flutter/material.dart';
import 'UI/Pages/home.dart';
import 'UI/mytheme.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: MyTheme.dark(),
    home: Home(),
  ));
}