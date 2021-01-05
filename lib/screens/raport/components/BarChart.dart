import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List items;
  BarChart({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        height: 50,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              for (var item in this.items)
                BarItem(color: Color(item['c_color']), size: item['sum']/this.totalSum())
            ],
          ),
        ));
  }

  double totalSum() {
    double sum = 0;
    this.items.forEach((element) {
      sum += element['sum'];
    });
    print("suma to: "+sum.toString());
    return sum;
  }
}

class BarItem extends StatelessWidget {
  final Color color;
  final double size;

  BarItem({Key key, @required this.color, @required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
            flex: (size*100).toInt(),
            child: Container(
          decoration: BoxDecoration(
            color: this.color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
    );
  }
}

// class BarChart extends StatefulWidget {
//   final List items;
//   double totalSum;

//   BarChart({Key key, @required this.items}) : super(key: key);
//   @override
//   _BarChartState createState() => _BarChartState();
// }

// class _BarChartState extends State<BarChart> {
//   @override
//   void initState() {
//     super.initState();
//     widget.items.forEach((element) {
//       widget.totalSum += element['sum'];
//     });
//     print(widget.items);
//   }
// }
