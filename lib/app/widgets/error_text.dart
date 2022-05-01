import 'package:flutter/material.dart';
import 'package:ravn_challenge/app/app.dart';

class ErrorText extends StatelessWidget {
  const ErrorText(this.data, {Key? key}) : super(key: key);
  final String data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: mediumSpacing),
        child: Text(
          data,
          style: context.primaryTextTheme.h2Emphasis,
        ),
      ),
    );
  }
}
