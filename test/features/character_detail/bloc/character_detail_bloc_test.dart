import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ravn_challenge/features/character_detail/character_detail.dart';

import '../../../mocks/character_repository.dart';

void main() {
  group('CharacterDetailBloc', () {
    final CharacterRepository characterRepository = MockCharacterRepository();
    final CharacterRepository characterFailRepository =
        MockCharacterFailRepository();
    blocTest<CharacterDetailBloc, CharacterDetailState>(
      'emits [CharacterDetailLoading, CharacterDetailLoaded] when '
      '[LoadCharacterDetail] event is added',
      build: () =>
          CharacterDetailBloc(characterRepository: characterRepository),
      act: (bloc) => bloc.add(const LoadCharacterDetail(id: '1')),
      expect: () => [
        equals(const CharacterDetailLoading()),
        equals(const CharacterDetailLoaded(characterDetail: characterDetail)),
      ],
    );
    blocTest<CharacterDetailBloc, CharacterDetailState>(
      'emits [CharacterDetailLoading, CharacterDetailError] when '
      '[LoadCharacterDetail] event is added and '
      '[CharacterDetailException] is thrown',
      build: () =>
          CharacterDetailBloc(characterRepository: characterFailRepository),
      act: (bloc) => bloc.add(const LoadCharacterDetail(id: '1')),
      expect: () => [
        equals(const CharacterDetailLoading()),
        equals(const CharacterDetailError()),
      ],
    );
  });
}
