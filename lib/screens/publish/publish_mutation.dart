import 'package:graphql/client.dart';

import '../../graphql/client.dart';
import 'publish_controller.dart';

const String _documment = r'''
mutation CreateMoment($data: MomentCreateInput!) {
  createMoment(data: $data) {
    id
    createdAt
    media
    title
    userId
    content
  }
}
''';

MutationOptions _createMomentMutationOptions(PublishController controller) {
  return MutationOptions(
    document: gql(_documment),
    variables: {
      'data': {
        'title': controller.title.isEmpty ? null : controller.title,
        'content': controller.content,
      },
    },
  );
}

createMoment(PublishController controller) async {
  final GraphQLClient client = await getGraphQLClient();
  final result = await client.mutate(
    _createMomentMutationOptions(controller),
  );

  if (result.hasException) {
    throw result.exception!.graphqlErrors.isNotEmpty
        ? result.exception!.graphqlErrors.first.message
        : result.exception!.linkException!;
  }

  return result.data!['createMoment'];
}
