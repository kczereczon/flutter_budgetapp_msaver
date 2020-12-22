import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pam_2020_msaver/components/Raport.dart';
import 'package:pam_2020_msaver/models/CategoryModel.dart';
import 'package:pam_2020_msaver/utils/SqliteDatabase.dart';

class Body extends StatefulWidget {
  Future<List<CategoryModel>> categories = SqliteDatabase.db.getAllCategories();

  @override
  State<Body> createState() {
    return _RaportView();
  }
}

class _RaportView extends State<Body> {
  SqliteDatabase sql;
  double getTotal, getMonth;
  String zl = "zł";

  @override
  void initState(){
      super.initState();
      displayTotal();
      diplayMonth();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child:Column(
        children: <Widget>[
      Container(
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
                Text("Raport",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Twoje wydatki z miesiąca",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w200)),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("LINIA KOLOR",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w200)),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(getMonth != null ? getMonth.toStringAsFixed(2) + zl : "brak wydatków",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w200)),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Twoje wydatki ogólne",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w200)),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("LINIA KOLOR",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w200)),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(getTotal != null ? getTotal.toStringAsFixed(2) + zl : "brak wydatków",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w200)),
              ],
            ),
          ],
        ),
        height: 240,
      ),
      Container(
          margin: EdgeInsets.only(top: 10),
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
                    Text("Kategorie",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
              ]))
    ]));
  }

  void displayTotal() async{
    var total = (await SqliteDatabase.db.getSumOutcome())[0]['sum'];
    setState(() {
      print("$total");
      getTotal = total;
    });
  }

  void diplayMonth() async {
    var total1 = (await SqliteDatabase.db.getSumMonth())[0]['sum'];
    setState(() {
      print("$total1");
      getMonth = total1;
    });
  }
}
