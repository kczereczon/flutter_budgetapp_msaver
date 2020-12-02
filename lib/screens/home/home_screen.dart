import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pam_2020_msaver/screens/home/components/Body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "MSAVER",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/left-arrow.svg"),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              icon: SvgPicture.asset("assets/icons/more.svg"), onPressed: null)
        ],
      ),
    );
  }
}
