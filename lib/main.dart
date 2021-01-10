import 'package:flutter/material.dart';
import 'package:MSAVER/screens/home/HomeScreen.dart';

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
