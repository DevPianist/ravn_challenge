import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ravn_challenge/app/app.dart';
import 'package:ravn_challenge/l10n/l10n.dart';

import '../mocks/character_repository.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      RepositoryProvider<CharacterRepository>(
        create: (context) => MockCharacterRepository(),
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          theme: buildThemeData(),
          home: widget,
        ),
      ),
    );
  }
}
