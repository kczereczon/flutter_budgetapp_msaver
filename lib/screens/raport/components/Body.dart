import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pam_2020_msaver/components/Raport.dart';
import 'package:pam_2020_msaver/models/CategoryModel.dart';
import 'package:pam_2020_msaver/screens/raport/components/BarChart.dart';
import 'package:pam_2020_msaver/utils/SqliteDatabase.dart';

class Body extends StatefulWidget {
  Future<List<CategoryModel>> categories = SqliteDatabase.db.getAllCategories();
  List allSummedMonth;
  List allSummed;

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
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Twoje wydatki z miesiąca",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w300)),
              ],
            ),
            BarChart(items: widget.allSummedMonth),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(getMonth != null ? getMonth.toStringAsFixed(2) + zl : "brak wydatków",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w200)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Twoje wydatki ogólne",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w300)),
              ],
            ),
            BarChart(items: widget.allSummedMonth),
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
    widget.allSummed = await SqliteDatabase.db.getSumOutcome();
    print(widget.allSummed);
    setState(() {
      double total = 0;
      widget.allSummed.forEach((item) {
        total += item['sum'];
      });
      getTotal = total;
    });
  }

  void diplayMonth() async {
    widget.allSummedMonth = await SqliteDatabase.db.getSumMonth();
    setState(() {
      double total = 0;
      widget.allSummedMonth.forEach((item) {
        total += item['sum'];
      });
      getMonth = total;
    });
  }
}
