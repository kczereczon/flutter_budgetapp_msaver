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
  Function delete;
  int id;

  Outcome(
      {Key key,
      this.id,
      this.dateTime,
      this.title,
      this.value,
      this.color,
      this.category,
      this.delete})
      : super(key: key);

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
          Expanded(
            flex: 8,
                      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(this.title),
                    Text(DateFormat('dd.MM.yyyy kk:mm').format(this.dateTime),
                        style: TextStyle(fontWeight: FontWeight.w200)),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      this.value.toStringAsFixed(2) + " zł",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Category(
                      color: this.category.color,
                      name: this.category.name,
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
          Expanded(child: InkResponse(onTap: () => this.delete(this.id), child: Icon(Icons.delete)))
        ],
      ),
      height: 70,
    );
  }
}
