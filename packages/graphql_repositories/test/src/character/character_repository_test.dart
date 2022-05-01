import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:graphql/client.dart';
import 'package:graphql_repositories/graphql_repositories.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockGqlClient extends Mock implements GraphQLClient {}

class _MockQueryOptions extends Mock implements QueryOptions {}

void main() {
  setUpAll(() {
    /// configuration to use in any()
    registerFallbackValue(_MockQueryOptions());
  });

  test(
      'the function fetch() of character graphql repository '
      'is called with success', () async {
    final client = _MockGqlClient();
    final CharacterRepository characterRepository =
        GraphQlCharacterRepository(client: client);

    when(() => client.query(any())).thenAnswer(
      (_) async => QueryResult(
        data: json.decode(characterListResponse) as Map<String, dynamic>,
        source: QueryResultSource.network,
        options: SubscriptionOptions(document: gql('')),
      ),
    );

    final characterList = await characterRepository.fetch(
      limit: 10,
      afterCode: null,
    );

    verify(() => client.query(any())).called(1);
    expect(characterList, isA<CharacterList>());
  });
  test(
      'the function fetch() of character graphql repository '
      'is called with error', () async {
    final client = _MockGqlClient();
    final CharacterRepository characterRepository =
        GraphQlCharacterRepository(client: client);

    when(() => client.query(any())).thenAnswer(
      (_) async => QueryResult(
        data: null,
        source: QueryResultSource.network,
        options: SubscriptionOptions(document: gql('')),
        exception: OperationException(),
      ),
    );

    try {
      await characterRepository.fetch(limit: 10, afterCode: null);
      fail('fetch() should throw a CharacterListException');
    } catch (e) {
      expect(e, isA<CharacterListException>());
    }

    verify(() => client.query(any())).called(1);
  });
  test(
      'the function findById(id) of character graphql repository '
      'is called with success', () async {
    final client = _MockGqlClient();
    final CharacterRepository characterRepository =
        GraphQlCharacterRepository(client: client);

    when(() => client.query(any())).thenAnswer(
      (_) async => QueryResult(
        data: json.decode(characterDetailResponse) as Map<String, dynamic>,
        source: QueryResultSource.network,
        options: SubscriptionOptions(document: gql('')),
      ),
    );

    final characterDetail = await characterRepository.findById('id');

    verify(() => client.query(any())).called(1);
    expect(characterDetail, isA<CharacterDetail>());
  });
  test(
      'the function findById(id) of character graphql repository '
      'is called with error', () async {
    final client = _MockGqlClient();
    final CharacterRepository characterRepository =
        GraphQlCharacterRepository(client: client);

    when(() => client.query(any())).thenAnswer(
      (_) async => QueryResult(
        data: null,
        source: QueryResultSource.network,
        options: SubscriptionOptions(document: gql('')),
        exception: OperationException(),
      ),
    );

    try {
      await characterRepository.findById('id');
      fail('findById(id) should throw a CharacterDetailException');
    } catch (e) {
      expect(e, isA<CharacterDetailException>());
    }

    verify(() => client.query(any())).called(1);
  });
}
