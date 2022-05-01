import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ravn_challenge/features/characters/characters.dart';

import '../../../mocks/character_repository.dart';
import '../helpers.dart';

void main() {
  group(
    'CharactersBloc',
    () {
      final CharacterRepository characterRepository = MockCharacterRepository();
      final CharacterRepository characterFailRepository =
          MockCharacterFailRepository();

      blocTest<CharactersBloc, CharactersState>(
        'emits [CharactersLoading, CharactersLoaded] when [LoadCharacters] '
        'event is added',
        build: () => CharactersBloc(characterRepository: characterRepository),
        act: (bloc) => bloc.add(LoadCharacters(lastUpdated: now)),
        expect: () => [
          equals(const CharactersLoading()),
          equals(charactersLoaded),
        ],
      );
      blocTest<CharactersBloc, CharactersState>(
        'emits [] when the [LoadNextCharacters] event is added but the '
        '[LoadCharacters] event has not been previously called',
        build: () => CharactersBloc(characterRepository: characterRepository),
        act: (bloc) => bloc.add(const LoadNextCharacters()),
        expect: () => <void>[],
      );
      blocTest<CharactersBloc, CharactersState>(
        'emits [CharactersLoading, CharactersLoaded] when '
        'the current state is [CharactersLoaded] and the LoadNextCharacters '
        'event is added ',
        build: () => CharactersBloc(characterRepository: characterRepository)
          ..emit(charactersLoaded),
        act: (bloc) => bloc.add(const LoadNextCharacters()),
        expect: () => [
          equals(charactersLoadingWithData),
          equals(charactersLoadedWithNextData),
        ],
      );

      blocTest<CharactersBloc, CharactersState>(
        'emits [CharactersLoading, CharactersError] when the current state is '
        '[CharactersLoaded], the LoadNextCharacters event is added and '
        '[CharactersListException] is thrown',
        build: () =>
            CharactersBloc(characterRepository: characterFailRepository)
              ..emit(charactersLoaded),
        act: (bloc) => bloc.add(const LoadNextCharacters()),
        expect: () => [
          equals(charactersLoadingWithData),
          equals(const CharactersError()),
        ],
      );
      blocTest<CharactersBloc, CharactersState>(
        'emits [CharactersLoading, CharactersError] when LoadCharacters event '
        'is added and [CharactersListException] is thrown',
        build: () =>
            CharactersBloc(characterRepository: characterFailRepository),
        act: (bloc) => bloc.add(LoadCharacters(lastUpdated: now)),
        expect: () => [
          equals(const CharactersLoading()),
          equals(const CharactersError()),
        ],
      );
      blocTest<CharactersBloc, CharactersState>(
        'emits [ShowingCharacterDetail] when the values of current state is '
        '[characterList != null && lastUpdated != null] and '
        '[ShowCharacterDetail] event is added',
        build: () => CharactersBloc(characterRepository: characterRepository)
          ..emit(charactersLoaded),
        act: (bloc) => bloc.add(
          ShowCharacterDetail(character: characterList.characters.first),
        ),
        expect: () => [
          equals(showingCharacterDetail),
        ],
      );
      blocTest<CharactersBloc, CharactersState>(
        'emits [] when ShowCharacterDetail event is added but the '
        '[LoadCharacters] event has not been previously called',
        build: () => CharactersBloc(characterRepository: characterRepository),
        act: (bloc) => bloc.add(
          ShowCharacterDetail(character: characterList.characters.first),
        ),
        expect: () => <void>[],
      );
    },
  );
}
