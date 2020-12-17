import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pam_2020_msaver/models/CategoryModel.dart';

class Outcome {
  final String name;
  final CategoryModel category;
  final Float value;
  Outcome({this.name, this.category, this.value});
}
