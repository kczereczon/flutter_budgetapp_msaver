import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:MSAVER/components/Category.dart';
import 'package:MSAVER/models/CategoryModel.dart';

class Outcome extends StatelessWidget {
  String title;
  double value;
  Color color;
  CategoryModel category;
  DateTime dateTime;

  Outcome(
      {Key key,
      this.dateTime,
      this.title,
      this.value,
      this.color,
      this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(this.title),
              Text(
                this.value.toStringAsFixed(2) + " zł",
                style: TextStyle(fontWeight: FontWeight.w300),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(DateFormat('dd.MM.yyyy kk:mm').format(this.dateTime),
                  style: TextStyle(fontWeight: FontWeight.w200)),
              Category(
                color: this.category.color,
                name: this.category.name,
              )
            ],
          ),
        ],
      ),
      height: 70,
    );
  }
}
