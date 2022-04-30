/// `CharacterException` The base class for all character exceptions.
abstract class CharacterException implements Exception {}

/// {@template domain.character_detail_exception}
/// Exception for character detail errors.
/// {@endtemplate}
class CharacterDetailException implements CharacterException {
  /// {@macro domain.character_detail_exception}
  const CharacterDetailException();
  @override
  String toString() => 'CharacterDetailException()';
}

/// {@template domain.character_list_exception}
/// Exception for character list errors.
/// {@endtemplate}
class CharacterListException implements CharacterException {
  /// {@macro domain.character_list_exception}
  const CharacterListException();
  @override
  String toString() => 'CharacterListException()';
}
