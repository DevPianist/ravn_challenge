import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ravn_challenge/app/app.dart';
import 'package:ravn_challenge/l10n/l10n.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final l10n = context.l10n;
    return Center(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: mediumSpacing),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (kIsWeb || platform == TargetPlatform.iOS)
                const CupertinoActivityIndicator()
              else
                const SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              const SizedBox(width: smallSpacing),
              Text(
                l10n.loading,
                style: context.primaryTextTheme.h2Light,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
