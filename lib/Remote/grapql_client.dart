import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

late final GraphQLClient graphqlClient;
setupGraphql() async {
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    'http://192.168.43.39:4000/graphql',
  );

  final defaultPolicies = Policies(fetch: FetchPolicy.networkOnly);

  final AuthLink authLink =
      AuthLink(getToken: () => 'Bearer ${GetStorage().read("token")}', headerKey: "Authorization");

  final Link link = authLink.concat(httpLink);

  graphqlClient = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
      defaultPolicies: DefaultPolicies(
          mutate: defaultPolicies, watchQuery: defaultPolicies, query: defaultPolicies),
    ),
  ).value;
}

class GraphqlActions {
  static void setAuth() {
    graphqlClient.link
        .concat(AuthLink(getToken: () => 'Bearer ${"hey"}', headerKey: "Authorization"));
  }

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
