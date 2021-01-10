import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:MSAVER/components/Category.dart';
import 'package:MSAVER/models/CategoryModel.dart';

class Raport extends StatelessWidget {
  double value;
  Color color;
  CategoryModel category;

  Raport({Key key, this.value, this.color, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Category(
            color: this.category.color,
            name: this.category.name,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [InkResponse(child: Icon(Icons.delete))],
          )
        ],
      ),
    ]);
  }
}
