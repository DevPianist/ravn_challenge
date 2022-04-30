import 'package:domain/domain.dart';
import 'package:graphql/client.dart';

part 'constants.dart';
// ignore_for_file: implicit_dynamic_parameter
// ignore_for_file: avoid_dynamic_calls

/// {@template graphql_repositories.character_repository}
/// Character repository that uses GraphQL to fetch data.
/// {@endtemplate}
class GraphQlCharacterRepository implements CharacterRepository {
  /// {@macro graphql_repositories.character_repository}
  const GraphQlCharacterRepository({
    required GraphQLClient client,
  }) : _client = client;

  final GraphQLClient _client;

  @override
  Future<CharacterList> fetch({
    required int limit,
    required String? afterCode,
  }) async {
    final variables = <String, dynamic>{
      'limit': limit,
      'afterCode': afterCode,
    };
    try {
      final options = QueryOptions(
        document: gql(_queryCharacterList),
        variables: variables,
      );
      final result = await _client.query(options);
      if (result.hasException) throw const CharacterListException();
      final data = result.data!;
      return _characterListFromMap(data['allPeople'] as Map<String, dynamic>);
    } catch (e) {
      throw const CharacterListException();
    }
  }

  @override
  Future<CharacterDetail> findById(String id) async {
    final variables = <String, dynamic>{
      'idPerson': id,
    };
    try {
      final options = QueryOptions(
        document: gql(_queryCharacterDetail),
        variables: variables,
      );
      final result = await _client.query(options);
      if (result.hasException) throw const CharacterDetailException();
      final data = result.data!;
      return _characterDetailFromMap(data['person'] as Map<String, dynamic>);
    } catch (e) {
      throw const CharacterDetailException();
    }
  }
}

List<Vehicle> _vehiclesFromList(List<dynamic> list) {
  return list.map((e) => _vehicleFromMap(e as Map<String, dynamic>)).toList();
}

Vehicle _vehicleFromMap(Map<String, dynamic> map) {
  return Vehicle(
    id: map['id'] as String,
    name: map['name'] as String,
  );
}

CharacterList _characterListFromMap(Map<String, dynamic> map) {
  return CharacterList(
    characters: _charactersFromList(map['people'] as List<dynamic>),
    afterCode: map['pageInfo']['endCursor'] as String,
    hasNextPage: map['pageInfo']['hasNextPage'] as bool,
  );
}

CharacterDetail _characterDetailFromMap(Map<String, dynamic> map) {
  return CharacterDetail(
    id: map['id'] as String,
    name: map['name'] as String,
    birthYear: map['birthYear'] as String,
    eyeColor: map['eyeColor'] as String,
    hairColor: map['hairColor'] as String,
    skinColor: map['skinColor'] as String,
    vehicles: _vehiclesFromList(
      map['vehicleConnection']['vehicles'] as List<dynamic>,
    ),
  );
}

List<Character> _charactersFromList(List<dynamic> list) {
  return list.map((e) => _characterFromMap(e as Map<String, dynamic>)).toList();
}

Character _characterFromMap(Map<String, dynamic> map) {
  return Character(
    id: map['id'] as String,
    name: map['name'] as String,
    homeworld: map['homeworld']['name'] as String,
    species: map['species']?['name'] as String?,
  );
}
