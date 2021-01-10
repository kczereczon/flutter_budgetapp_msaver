import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:MSAVER/screens/home/components/Body.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  AppScaffold({this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 0.5, 0.9],
          colors: [
            Colors.deepPurple[900],
            Colors.pink,
            Colors.yellow,
          ],
        ),
      ),
      child: Scaffold(
        body: this.body,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "MSAVER",
            style:
                TextStyle(color: Colors.white, fontSize: 33, letterSpacing: 2),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Visibility(
              child: IconButton(
                  icon: SvgPicture.asset("assets/icons/left-arrow.svg"),
                  onPressed: () {
                    Navigator.maybePop(context, true);
                  }),
              visible: Navigator.canPop(context)),
        ),
      ),
    );
  }
}
