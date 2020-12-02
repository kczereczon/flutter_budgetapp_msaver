import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pam_2020_msaver/models/Category.dart';

class Outcome {
  final String name;
  final Category category;
  final Float value;
  final List<Outcome> outcomes;
  Outcome({this.name, this.category, this.value, this.outcomes});
}
