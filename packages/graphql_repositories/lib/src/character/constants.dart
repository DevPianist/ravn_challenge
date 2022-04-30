part of 'character_repository.dart';

const _queryCharacterList = r'''
query queryCharacterList($limit: Int!, $afterCode: String) {
  allPeople(first: $limit, after: $afterCode) {
    pageInfo {
      hasNextPage
      endCursor
    }
    totalCount
    people {
      id
      name
      species {
        name
      }
      homeworld {
        name
      }
    }
  }
}
''';

const _queryCharacterDetail = r'''
query queryCharacterDetail($idPerson: ID!) {
  person(id: $idPerson) {
    id
    name
    eyeColor
    hairColor
    skinColor
    birthYear
    vehicleConnection {
      vehicles {
        id
        name
      }
    }
  }
}
''';
