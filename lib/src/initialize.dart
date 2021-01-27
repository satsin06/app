import 'context.dart';

Context initializeSocfony(Uri serverEndpoint) {
  Context.get().serverEndpoint = serverEndpoint;

  return Context.get();
}
