import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            child: Buttons(),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(10)),
        )
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RaisedButton(
              child: Text('+ KATEGORIA'),
              onPressed: () => null,
            ),
            RaisedButton(
              child: Text('REPORT'),
              onPressed: () => null,
            ),
            RaisedButton(
              child: Text('+ WYDATEK'),
              onPressed: () => null,
            ),
          ],
        ));
  }
}
