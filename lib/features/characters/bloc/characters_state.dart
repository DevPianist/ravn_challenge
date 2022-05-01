part of 'characters_bloc.dart';

@immutable
abstract class CharactersState extends Equatable {
  const CharactersState(
    this.characterList,
    this.lastUpdated,
  );

  final CharacterList? characterList;
  final DateTime? lastUpdated;
  @override
  List<Object?> get props => [characterList, lastUpdated];
}

class CharactersInitial extends CharactersState {
  const CharactersInitial() : super(null, null);
}

class CharactersLoading extends CharactersState {
  const CharactersLoading({CharacterList? characterList, DateTime? lastUpdated})
      : super(characterList, lastUpdated);
}

class CharactersLoaded extends CharactersState {
  const CharactersLoaded({
    required CharacterList characterList,
    required DateTime lastUpdated,
  }) : super(characterList, lastUpdated);
}

class CharactersError extends CharactersState {
  const CharactersError() : super(null, null);
}

class ShowingCharacterDetail extends CharactersState {
  const ShowingCharacterDetail({
    required this.character,
    required CharacterList characterList,
    required DateTime lastUpdated,
  }) : super(characterList, lastUpdated);
  final Character character;
  @override
  List<Object?> get props => [characterList, lastUpdated, character];
}
