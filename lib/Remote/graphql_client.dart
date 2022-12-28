import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

late final GraphQLClient graphqlClient;

//Setup graphql
setupGraphql() async {
  await initHiveForFlutter(); // initializes hive

  final HttpLink httpLink = HttpLink(
    // set endpoint
    //'https://grocery-backend.onrender.com/graphql',
    'http://192.168.43.39:4000/graphql',
  );

  final defaultPolicies = Policies(fetch: FetchPolicy.networkOnly); // defines networkpolicy

  final AuthLink authLink = AuthLink(
      getToken: () => 'Bearer ${GetStorage().read("token")}',
      headerKey: "Authorization"); // attaches auth token

  final Link link = authLink.concat(httpLink); // generates a link

  graphqlClient = ValueNotifier(
    // creating a graphqlClient.
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
      defaultPolicies: DefaultPolicies(
          mutate: defaultPolicies, watchQuery: defaultPolicies, query: defaultPolicies),
    ),
  ).value;
}

//Graphql Actions for basic graphql query and mutations.
class GraphqlActions {
  static void setAuth() {
    graphqlClient.link
        .concat(AuthLink(getToken: () => 'Bearer ${"hey"}', headerKey: "Authorization"));
  }

  //Mutation
  static Future<Map<String, dynamic>?> mutate(
      {required String api, Map<String, dynamic>? variables}) async {
    var result = await graphqlClient.mutate(
      MutationOptions(document: gql(api), variables: variables ?? {},),
    );
    if (result.hasException) {
      throw result.exception!;
    }
    return result.data;
  }

  //Query
  static Future<Map<String, dynamic>?> query(
      {required api, Map<String, dynamic>? variables}) async {
    var result = await graphqlClient.query(
      QueryOptions(document: gql(api), variables: variables ?? {} ,  pollInterval: const Duration(seconds: 10),),
    );
    if (result.hasException) {
      throw result.exception!;
    }
    return result.data;
  }
}
