import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ravn_challenge/app/app.dart';
import 'package:ravn_challenge/features/characters/characters.dart';

import '../../../helpers/helpers.dart';
import '../../../mocks/character_repository.dart';

void main() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized()
      as TestWidgetsFlutterBinding;
  setUpAll(() {
    registerFallbackValue(MockQueryOptions());
  });
  testWidgets('CharactersView success and CharacterDetailView success',
      (tester) async {
    final characterRepository = MockRandomCharacterRepository();
    await tester.pumpApp(App(characterRepository: characterRepository));
    final charactersViewFinder = find.byType(CharactersView);
    await tester.pumpAndSettle();
    await tester.drag(
      charactersViewFinder,
      const Offset(0, 900),
    );
    await tester.pumpAndSettle();
    final characterTileFinder = find.byKey(const Key('CharacterTile-0'));
    await tester.tap(characterTileFinder);
    await tester.pumpAndSettle();
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(charactersViewFinder, findsOneWidget);
    expect(characterTileFinder, findsOneWidget);
  });
  testWidgets(
      'CharactersView Large success and CharacterDetailView success and '
      'empty vehicles', (tester) async {
    binding.window.physicalSizeTestValue = const Size(1000, 600);
    binding.window.devicePixelRatioTestValue = 1.0;
    final characterRepository =
        MockRandomCharacterRepository(withVehicles: false);

    await tester.pumpApp(App(characterRepository: characterRepository));
    final charactersViewFinder = find.byType(CharactersView);
    await tester.pumpAndSettle(
      const Duration(milliseconds: 500),
    );
    await tester.drag(
      charactersViewFinder,
      const Offset(0, 900),
    );
    await tester.pumpAndSettle();
    final characterTileFinder = find.byKey(const Key('CharacterTile-0'));
    await tester.tap(characterTileFinder);
    await tester.pumpAndSettle();
    final characterDetailTileFinder = find.byKey(const Key('eye-color'));
    expect(characterDetailTileFinder, findsOneWidget);
    expect(charactersViewFinder, findsOneWidget);
    expect(characterTileFinder, findsOneWidget);
    binding.window.clearPhysicalSizeTestValue();
    binding.window.clearDevicePixelRatioTestValue();
  });
  testWidgets('CharactersView failure', (tester) async {
    final characterRepository = MockCharacterFailRepository();
    await tester.pumpApp(App(characterRepository: characterRepository));
    await tester.pumpAndSettle(
      const Duration(milliseconds: 500),
    );
    final errorTextFinder = find.byType(ErrorText);
    expect(errorTextFinder, findsOneWidget);
  });
  testWidgets('CharactersView success and CharacterDetail failure',
      (tester) async {
    final characterRepository = MockCharacterFailRepository(fetchFail: false);
    await tester.pumpApp(App(characterRepository: characterRepository));

    final charactersViewFinder = find.byType(CharactersView);
    await tester.pumpAndSettle();
    await tester.drag(
      charactersViewFinder,
      const Offset(0, 900),
    );
    await tester.pumpAndSettle();
    final characterTileFinder = find.byKey(const Key('CharacterTile-0'));
    await tester.tap(characterTileFinder);
    await tester.pumpAndSettle();
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(charactersViewFinder, findsOneWidget);
    expect(characterTileFinder, findsOneWidget);
  });
}
