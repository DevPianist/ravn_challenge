import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ravn_challenge/app/app.dart';

export 'colors.dart';
export 'constants.dart';
export 'styles.dart';
export 'utils.dart';

ThemeData buildThemeData() => ThemeData(
      colorScheme: const ColorScheme.light(
        primary: AppColors.ravnBlack,
      ),
      primaryTextTheme: const TextTheme(
        headline2: AppStyles.h2,
        bodyText1: AppStyles.p1,
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: AppStyles.h2.copyWith(
          color: AppColors.white,
        ),
        toolbarHeight: 50,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        centerTitle: true,
        iconTheme: const IconThemeData(
          size: 26,
          color: Colors.white,
        ),
      ),
    );
