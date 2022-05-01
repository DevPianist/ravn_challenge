import 'package:domain/src/character/entities/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// {@template domain.character_detail}
/// CharacterDetail domain entity.
/// {@endtemplate}
@immutable
class CharacterDetail extends Equatable {
  /// {@macro domain.character_detail}
  const CharacterDetail({
    required this.id,
    required this.name,
    required this.eyeColor,
    required this.hairColor,
    required this.skinColor,
    required this.birthYear,
    required this.vehicles,
  });

  /// `id` The character's unique ID.
  final String id;

  /// `name` The name of the character.
  final String name;

  /// `eyeColor` The eye color of the character.
  final String eyeColor;

  /// `hairColor` The hair color of the character.
  final String hairColor;

  /// `vehicles` The vehicles of the character.
  final List<Vehicle> vehicles;

  /// `skinColor` The skin color of the character.
  final String skinColor;

  /// `birthYear` The birth year of the character.
  final String birthYear;

  @override
  String toString() => 'CharacterDetail(id: $id, name: $name, '
      'eyeColor: $eyeColor, hairColor: $hairColor, '
      'vehicles: $vehicles, skinColor: $skinColor, birthYear: $birthYear)';

  @override
  List<Object?> get props =>
      [id, name, eyeColor, hairColor, vehicles, skinColor, birthYear];
}
