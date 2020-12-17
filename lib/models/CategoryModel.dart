import 'package:flutter/material.dart';

class CategoryModel {
  final Color color;
  final String name;
  int id;
  CategoryModel({this.color, this.name, this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color.toString(),
    };
  }
}
