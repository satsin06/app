import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:socfony/graphql/mutations/sign-in/sign-in.req.gql.dart';
import 'package:socfony/graphql/schema/schema.schema.gql.dart';

final link = HttpLink('http://127.0.0.1:3000');
final client = Client(link: link);

final createAuthorizationTokenRequest =
    GCreateAuthorizationTokenReq((builder) => {
          builder
            ..fetchPolicy = FetchPolicy.NetworkOnly
            ..vars.user.username = 'socfony'
            ..vars.security = 'socfony'
            ..vars.type = GUserSecurityCompareType.PASSWORD
        });

demo() {
  client.request(createAuthorizationTokenRequest).listen(
      (response) => print(response.data));
}
