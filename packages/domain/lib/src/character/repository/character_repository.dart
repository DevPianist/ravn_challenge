import 'package:domain/src/character/entities/entities.dart';

/// Character repository interface for retrieving character data.
abstract class CharacterRepository {
  /// Retrieves a list of characters.
  Future<CharacterList> fetch({
    required int limit,
    required String? afterCode,
  });

  /// Retrieves a character by id.
  Future<CharacterDetail> findById(String id);
}
