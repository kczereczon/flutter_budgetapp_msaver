import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            child: Buttons(),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20)),
        Column(
          children: [
            Outcome(),
            Outcome(),
            Outcome(),
            Outcome(),
            Outcome(),
            Outcome(),
            Outcome(),
            Outcome(),
            Outcome(),
            Outcome(),
          ],
        )
      ],
    );
  }
}

class Outcome extends StatelessWidget {
  const Outcome({
    Key key,
  }) : super(key: key);

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
              Text("Opłata za mieszkanie"),
              Text(
                "1800zł",
                style: TextStyle(fontWeight: FontWeight.w300),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("wczoraj", style: TextStyle(fontWeight: FontWeight.w200)),
              Container(
                child: Text("Mieszkanie",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    )),
                padding: EdgeInsets.symmetric(horizontal: 13.0),
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10)),
              )
            ],
          ),
        ],
      ),
      height: 70,
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
