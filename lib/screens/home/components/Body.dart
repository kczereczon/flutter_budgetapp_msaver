import 'dart:wasm';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pam_2020_msaver/components/Outcome.dart';
import 'package:pam_2020_msaver/models/CategoryModel.dart';
import 'package:pam_2020_msaver/models/OutcomeModel.dart';
import 'package:pam_2020_msaver/utils/SqliteDatabase.dart';
import 'package:sqflite/sqflite.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            child: Buttons(),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20)),
        Expanded(
            child: FutureBuilder<List<OutcomeModel>>(
          future: SqliteDatabase.db.getAllOutcomes(),
          builder: (BuildContext context,
              AsyncSnapshot<List<OutcomeModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(9),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  OutcomeModel item = snapshot.data[index];
                  return Outcome(
                      title: item.name,
                      dateTime: item.dateTime,
                      value: item.value,
                      category: CategoryModel(
                          color: Color(0xffff0000), name: "pralnia"));
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ))
      ],
    );
  }
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton(
              child: Text('+ KATEGORIA', style: TextStyle(color: Colors.white)),
              onPressed: () => null,
              color: Color.lerp(Colors.transparent, Colors.grey[100], 0.6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            FlatButton(
              child: Text('REPORT', style: TextStyle(color: Colors.white)),
              onPressed: () => null,
              color: Color.lerp(Colors.transparent, Colors.grey[100], 0.6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            FlatButton(
              child: Text('+ WYDATEK', style: TextStyle(color: Colors.white)),
              onPressed: () => null,
              color: Color.lerp(Colors.transparent, Colors.grey[100], 0.6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ],
        ));
  }
}
