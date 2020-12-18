import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:pam_2020_msaver/components/Category.dart';

class CategoryElement extends StatelessWidget {
  final Color color;
  final String name;
  CategoryElement({this.color, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: [
          Category(
            color: this.color,
            name: this.name,
          )
        ],
      ),
      height: 50,
    );
  }
}
