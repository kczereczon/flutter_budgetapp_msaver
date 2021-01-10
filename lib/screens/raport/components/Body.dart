import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:MSAVER/components/Raport.dart';
import 'package:MSAVER/models/CategoryModel.dart';
import 'package:MSAVER/screens/raport/components/BarChart.dart';
import 'package:MSAVER/utils/SqliteDatabase.dart';

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
  void initState() {
    super.initState();
    displayTotal();
    diplayMonth();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Center(
          child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 8),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
                  Text(
                      getMonth != null
                          ? getMonth.toStringAsFixed(2) + zl
                          : "brak wydatków",
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
                  Text(
                      getTotal != null
                          ? getTotal.toStringAsFixed(2) + zl
                          : "brak wydatków",
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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Twoje wydatki z tego miesiąca",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ])),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
              itemCount: widget.allSummedMonth.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var item = widget.allSummedMonth[index];
                print(item['c_name'].toString());
                if (item['sum'] > 0) {
                  return Category(item: item);
                }
                return null;
              }),
        ),
      ])),
    );
  }

  void displayTotal() async {
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

class Category extends StatelessWidget {
  const Category({
    Key key,
    @required this.item,
  }) : super(key: key);

  final item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
                color: Color(item['c_color']),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              item['c_name'],
              style: TextStyle(
                  color:
                      useWhiteForeground(Color(item['c_color']))
                          ? const Color(0xffffffff)
                          : const Color(0xff000000)),
            ),
          ),
          Text(item['sum'].toStringAsFixed(2) + " zł", style: TextStyle(fontWeight: FontWeight.w300))
        ],
      ),
    );
  }
}
