import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

late final GraphQLClient graphqlClient;
setupGraphql() async {
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    'https://api.github.com/graphql',
  );

  final AuthLink authLink = AuthLink(
    getToken: () => 'Bearer ${GetStorage().read("token")}',
  );

  final Link link = authLink.concat(httpLink);

  graphqlClient = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    ),
  ).value;
}

class GraphqlActions {
  static Future<Map<String, dynamic>?> mutate(
      {required String api, Map<String, dynamic>? variables}) async {
    var result = await graphqlClient.mutate(
      MutationOptions(document: gql(api), variables: variables ?? {}),
    );
    if (result.hasException) {
      throw result.exception!;
    }
    return result.data;
  }

  static Future<Map<String, dynamic>?> query(
      {required api, Map<String, dynamic>? variables}) async {
    var result = await graphqlClient.query(
      QueryOptions(document: gql(api), variables: variables ?? {}),
    );
    if (result.hasException) {
      throw result.exception!;
    }
    return result.data;
  }
}
