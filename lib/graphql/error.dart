import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

@JsonSerializable()
class GraphQLError {
  final String message;

  GraphQLError(this.message);

  factory GraphQLError.fromJson(Map<String, dynamic> json) => _$GraphQLErrorFromJson(json);
}