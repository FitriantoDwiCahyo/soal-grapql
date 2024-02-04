import 'package:graphql/client.dart';

void main() async {
  final link = HttpLink(
      'https://countries.trevorblades.com/'); // Ganti dengan URL GraphQL server Anda

  final client = GraphQLClient(
    link: link,
    cache: GraphQLCache(),
  );

  final query = gql('''
    query {
      continents {
        name
      }
    }
  ''');

  final result = await client.query(QueryOptions(document: query,));

  if (result.hasException) {
    print('Error: ${result.exception.toString()}');
  }

  for (var i = 0; i < result.data!['continents'].length; i++) {
    String countries = result.data!['continents'][i]['name'];

    print(countries);
  }
}
