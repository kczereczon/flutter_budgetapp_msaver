import 'dart:wasm';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pam_2020_msaver/components/Outcome.dart';
import 'package:pam_2020_msaver/models/CategoryModel.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            child: Buttons(),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20)),
        Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(8),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Outcome(
                    title: "Siema",
                    category: CategoryModel(color: Colors.amber, name: "siema"),
                    value: 10,
                    dateTime: DateTime.now(),
                  );
                }))
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
            RaisedButton(
              child: Text('+ KATEGORIA', style: TextStyle(color: Colors.white)),
              onPressed: () => null,
              color: Color.lerp(Colors.transparent, Colors.grey[100], 0.6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            RaisedButton(
              child: Text('REPORT', style: TextStyle(color: Colors.white)),
              onPressed: () => null,
              color: Color.lerp(Colors.transparent, Colors.grey[100], 0.6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            RaisedButton(
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
