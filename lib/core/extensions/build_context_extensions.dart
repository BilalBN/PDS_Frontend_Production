import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  double get getWidth => MediaQuery.of(this).size.width;
  bool get isTablet => MediaQuery.of(this).size.width >= 600;
}
