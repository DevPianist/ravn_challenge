import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// {@template domain.character}
/// Character domain entity.
/// {@endtemplate}
@immutable
class Character extends Equatable {
  /// {@macro domain.character}
  const Character({
    required this.id,
    required this.name,
    required this.species,
    required this.homeworld,
  });

  /// `id` The character's unique ID.
  final String id;

  /// `name` The name of the character.
  final String name;

  /// `species` The species of the character.
  final String? species;

  /// `homeworld` The homeworld of the character.
  final String homeworld;

  /// `description` The description of the character.
  String get description => '${species ?? 'Human'} from $homeworld';

  @override
  String toString() => 'Character(id: $id, name: $name, species: $species, '
      'homeworld: $homeworld)';

  @override
  List<Object?> get props => [id, name, species, homeworld];
}
