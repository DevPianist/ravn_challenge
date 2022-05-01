import 'dart:math';

import 'package:domain/domain.dart';
import 'package:graphql/client.dart';
import 'package:mocktail/mocktail.dart';

class MockGraphQLClient extends Mock implements GraphQLClient {}

class MockQueryOptions extends Mock implements QueryOptions {}

class MockRandomCharacterRepository extends Mock
    implements CharacterRepository {
  MockRandomCharacterRepository({
    this.withVehicles = true,
  });

  final bool withVehicles;
  @override
  Future<CharacterList> fetch({
    required int limit,
    required String? afterCode,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    if (Random().nextBool()) {
      return characterList;
    } else {
      return characterListWithoutHasNextPage;
    }
  }

  @override
  Future<CharacterDetail> findById(
    String id,
  ) async {
    if (withVehicles) {
      return characterDetail;
    } else {
      return characterDetailWithoutVehicles;
    }
  }
}

class MockCharacterRepository extends Mock implements CharacterRepository {
  @override
  Future<CharacterList> fetch({
    required int limit,
    required String? afterCode,
  }) async {
    return characterList;
  }

  @override
  Future<CharacterDetail> findById(
    String id,
  ) async {
    return characterDetail;
  }
}

class MockCharacterFailRepository extends Mock implements CharacterRepository {
  MockCharacterFailRepository({
    this.fetchFail = true,
    this.findByIdFail = true,
  });

  final bool fetchFail;
  final bool findByIdFail;
  @override
  Future<CharacterList> fetch({
    required int limit,
    required String? afterCode,
  }) async {
    if (fetchFail) throw const CharacterListException();
    await Future<void>.delayed(const Duration(milliseconds: 400));
    if (Random().nextBool()) {
      return characterList;
    } else {
      return characterListWithoutHasNextPage;
    }
  }

  @override
  Future<CharacterDetail> findById(
    String id,
  ) async {
    if (findByIdFail) throw const CharacterDetailException();
    return characterDetail;
  }
}

final characterList = CharacterList(
  characters: List.generate(
    20,
    (index) => Character(
      id: '$index cGVvcGxlOjEw',
      name: '$index Luke Skywalker',
      homeworld: '$index Tatooine',
      species: null,
    ),
  ),
  hasNextPage: true,
  afterCode: 'YXJyYXljb25uZWN0aW9uOjE5',
);
final characterListWithoutHasNextPage = CharacterList(
  characters: List.generate(
    20,
    (index) => Character(
      id: '$index cGVvcGxlOjEw',
      name: '$index Luke Skywalker',
      homeworld: '$index Tatooine',
      species: null,
    ),
  ),
  hasNextPage: false,
  afterCode: 'YXJyYXljb25uZWN0aW9uOjE5',
);
const characterDetail = CharacterDetail(
  id: 'cGVvcGxlOjk=',
  name: 'Biggs Darklighter',
  eyeColor: 'brown',
  hairColor: 'black',
  skinColor: 'light',
  birthYear: '24BBY',
  vehicles: [
    Vehicle(id: 'dmVoaWNsZXM6MTQ=', name: 'Snowspeeder'),
    Vehicle(id: 'dmVoaWNsZXM6MzA=', name: 'Imperial Speeder Bike'),
  ],
);
const characterDetailWithoutVehicles = CharacterDetail(
  id: 'cGVvcGxlOjk=',
  name: 'Biggs Darklighter',
  eyeColor: 'brown',
  hairColor: 'black',
  skinColor: 'light',
  birthYear: '24BBY',
  vehicles: [],
);
