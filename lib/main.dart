import 'package:flutter/material.dart';
import 'package:pam_2020_msaver/models/CategoryModel.dart';
import 'package:pam_2020_msaver/screens/home/home_screen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme:
                Theme.of(context).textTheme.apply(bodyColor: Colors.black),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            backgroundColor: Colors.orange[100]),
        home: HomeScreen());
  }
}
