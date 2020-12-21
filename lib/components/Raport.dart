import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pam_2020_msaver/components/Category.dart';
import 'package:pam_2020_msaver/models/CategoryModel.dart';

class Raport extends StatelessWidget {
  double value;
  Color color;
  CategoryModel category;

  Raport(
      {Key key,
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
              Text("Raport", style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              )),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Twoje wydatki z miesiąca", style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w200
              )),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("LINIA KOLOR", style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w200
              )),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Twoje wydatki z miesiąca", style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200
              )),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Twoje wydatki ogólne", style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w200
              )),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("LINIA KOLOR", style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w200
              )),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Twoje wydatki ogólne", style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200
              )),
            ],
          ),
        ],
      ),
      height: 240,
    );
  }
}
