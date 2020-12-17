import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            child: Buttons(),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20)),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          width: MediaQuery.of(context).size.width * 0.9,
          height: 70,
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
        child:
         Row(
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
        )
    );
  }
}
