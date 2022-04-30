import 'package:domain/src/character/character.dart';
import 'package:meta/meta.dart';

/// {@template domain.character_list}
/// CharacterList domain entity.
/// {@endtemplate}
@immutable
class CharacterList {
  /// {@macro domain.character_list}
  const CharacterList({
    required this.characters,
    required this.hasNextPage,
    required this.afterCode,
  });

  /// `characters` The list of characters.
  final List<Character> characters;

  /// `hasNextPage` Indicates if there is a next page.
  final bool hasNextPage;

  /// `afterCode` The code to use to get the next page.
  final String afterCode;

  @override
  String toString() => 'CharacterList(characters: $characters, '
      'hasNextPage: $hasNextPage, afterCode: $afterCode)';
}
