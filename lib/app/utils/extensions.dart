import 'package:flutter/material.dart';

extension ScrollControllerX on ScrollController {
  double get remainingHeight => position.maxScrollExtent - offset;
}
