import 'package:domain/domain.dart';
import 'package:ravn_challenge/features/characters/characters.dart';

import '../../mocks/character_repository.dart';

final now = DateTime.now();

final charactersLoaded = CharactersLoaded(
  characterList: characterList,
  lastUpdated: now,
);
final charactersLoadingWithData =
    CharactersLoading(characterList: characterList, lastUpdated: now);

final charactersLoadedWithNextData = CharactersLoaded(
  characterList: CharacterList(
    afterCode: characterList.afterCode,
    characters: [
      ...characterList.characters,
      ...characterList.characters,
    ],
    hasNextPage: characterList.hasNextPage,
  ),
  lastUpdated: now,
);

final showingCharacterDetail = ShowingCharacterDetail(
  character: characterList.characters.first,
  characterList: characterList,
  lastUpdated: now,
);
