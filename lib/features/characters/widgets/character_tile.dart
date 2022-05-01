import 'package:flutter/material.dart';
import 'package:ravn_challenge/app/app.dart';

class CharacterTile extends StatelessWidget {
  const CharacterTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final primaryTextTheme = context.primaryTextTheme;
    return FadeIn(
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(mediumSpacing),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: primaryTextTheme.h2),
                      Text(subtitle, style: primaryTextTheme.p1Light),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            const AppDivider(),
          ],
        ),
      ),
    );
  }
}
