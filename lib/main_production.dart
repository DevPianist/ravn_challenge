import 'package:graphql/client.dart';
import 'package:graphql_repositories/graphql_repositories.dart';
import 'package:ravn_challenge/app/app.dart';
import 'package:ravn_challenge/bootstrap.dart';
import 'package:ravn_challenge/env/env_production.dart';

void main() {
  final httpLink = HttpLink(
    environment.baseUrl,
  );
  final client = GraphQLClient(
    cache: GraphQLCache(),
    link: httpLink,
  );
  bootstrap(
    () => App(
      characterRepository: GraphQlCharacterRepository(
        client: client,
      ),
    ),
  );
}
