import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:pam_2020_msaver/components/Category.dart';
import 'package:pam_2020_msaver/models/CategoryModel.dart';

class CategoryElement extends StatelessWidget {
  final CategoryModel categoryModel;
  CategoryElement({this.categoryModel, @required this.delete});

  final Function delete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Category(
            color: this.categoryModel.color,
            name: this.categoryModel.name,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [InkResponse(onTap: delete, child: Icon(Icons.delete))],
          )
        ],
      ),
      height: 50,
    );
  }
}
