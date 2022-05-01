import 'package:domain/src/character/entities/character.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// {@template domain.character_list}
/// CharacterList domain entity.
/// {@endtemplate}
@immutable
class CharacterList extends Equatable {
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

  @override
  List<Object> get props => [characters, hasNextPage, afterCode];
}
