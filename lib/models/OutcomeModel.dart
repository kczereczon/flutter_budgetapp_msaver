import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pam_2020_msaver/models/CategoryModel.dart';

class OutcomeModel {
  int id;
  final String name;
  final CategoryModel category;
  final Float value;
  final DateTime dateTime;
  OutcomeModel({this.name, this.category, this.value, this.id, this.dateTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': value,
      'category_id': category.id,
      'datetime': dateTime.toIso8601String()
    };
  }
}
