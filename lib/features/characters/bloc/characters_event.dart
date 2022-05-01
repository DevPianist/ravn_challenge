part of 'characters_bloc.dart';

abstract class CharactersEvent {
  const CharactersEvent();
}

class LoadCharacters extends CharactersEvent {
  const LoadCharacters({
    required this.lastUpdated,
  });
  final DateTime lastUpdated;
}

class LoadNextCharacters extends CharactersEvent {
  const LoadNextCharacters();
}

class ShowCharacterDetail extends CharactersEvent {
  const ShowCharacterDetail({required this.character});
  final Character character;
}

class ReturnToList extends CharactersEvent {
  const ReturnToList();
}
