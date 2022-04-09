import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';

import 'graphql.dart';

final queryStorageDownloadUrl =
    FutureProvider.autoDispose.family<String, String>(
  (Ref ref, String id) async {
    final client = ref.read(graphqlClientProvider);
    final QueryOptions<String> queryOptions = QueryOptions<String>(
      document: gql(r'''
        query Storage($storageId: String!, $query: String, $headers: String) {
          storage(id: $storageId) {
            url(query: $query, headers: $headers)
          }
        }
      '''),
      variables: {'storageId': id},
      parserFn: (data) => data['storage']['url'],
    );

    final result = await client.query(queryOptions);
    thenGraphQLResultException(result);

    return result.parsedData!;
  },
);
