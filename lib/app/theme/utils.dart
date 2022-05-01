import 'package:flutter/material.dart';
import 'package:ravn_challenge/app/app.dart';

extension BuildContextX on BuildContext {
  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;
}

extension TextThemeX on TextTheme {
  TextStyle? get h2 => headline2;
  TextStyle? get h2White => h2?.copyWith(
        color: AppColors.white,
      );
  TextStyle? get h2Light => h2?.copyWith(
        color: AppColors.textLight,
      );
  TextStyle? get h2Emphasis => h2?.copyWith(
        color: AppColors.textEmphasis,
      );
  TextStyle? get p1 => bodyText1;
  TextStyle? get p1Light => bodyText1?.copyWith(
        color: AppColors.textLight,
      );
}

extension StringX on String {
  String get capitalize =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : this;
}
