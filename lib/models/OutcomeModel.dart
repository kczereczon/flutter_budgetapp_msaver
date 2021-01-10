import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:MSAVER/models/CategoryModel.dart';

class OutcomeModel {
  int id;
  final String name;
  final CategoryModel category;
  final double value;
  final DateTime dateTime;
  OutcomeModel({this.name, this.category, this.value, this.id, this.dateTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'value': value,
      'category_id': category.id,
      'datetime': dateTime.toIso8601String()
    };
  }
}
