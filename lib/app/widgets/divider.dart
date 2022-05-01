import 'package:flutter/material.dart';
import 'package:ravn_challenge/app/app.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: mediumSpacing),
      child: Divider(
        height: 1,
        thickness: 1,
        color: Colors.black.withOpacity(0.1),
      ),
    );
  }
}
