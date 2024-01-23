import 'package:flutter/material.dart';
import 'package:todo/home.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.grey,
    appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFFFFAFCC)
    ),
  ),// ThemeData
  home: Home(),
)); // MaterialApp
