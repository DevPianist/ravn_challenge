import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ravn_challenge/app/app.dart';
import 'package:ravn_challenge/features/characters/characters.dart';
import 'package:ravn_challenge/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.characterRepository,
  }) : super(key: key);
  final CharacterRepository characterRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CharacterRepository>(
          create: (context) => characterRepository,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: buildThemeData(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const CharactersView(),
        builder: (context, child) {
          final mediaQuery = MediaQuery.of(context);
          return MediaQuery(
            data: mediaQuery.copyWith(
              textScaleFactor: 1,
            ),
            child: child!,
          );
        },
      ),
    );
  }
}
