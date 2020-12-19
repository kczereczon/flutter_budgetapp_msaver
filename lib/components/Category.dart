import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Category extends StatelessWidget {
  final Color color;
  final String name;
  Category({this.color, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.name,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: useWhiteForeground(this.color)
                ? const Color(0xffffffff)
                : const Color(0xff000000),
          )),
      padding: EdgeInsets.symmetric(horizontal: 13.0),
      decoration: BoxDecoration(
          color: this.color, borderRadius: BorderRadius.circular(10)),
    );
  }
}
