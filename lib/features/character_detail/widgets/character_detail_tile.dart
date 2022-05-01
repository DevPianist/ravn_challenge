import 'package:flutter/material.dart';
import 'package:ravn_challenge/app/app.dart';

class CharacterDetailTile extends StatelessWidget {
  const CharacterDetailTile({
    Key? key,
    required this.info,
    this.detail,
  }) : super(key: key);

  final String info;
  final String? detail;
  @override
  Widget build(BuildContext context) {
    final primaryTextTheme = context.primaryTextTheme;
    return FadeIn(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 14,
              bottom: 15,
              left: mediumSpacing,
              right: mediumSpacing,
            ),
            child: Row(
              children: [
                Text(info, style: primaryTextTheme.h2Light),
                const Spacer(),
                if (detail != null)
                  Text(detail!.capitalize, style: primaryTextTheme.h2),
              ],
            ),
          ),
          const AppDivider(),
        ],
      ),
    );
  }
}
