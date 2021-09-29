import 'package:json_annotation/json_annotation.dart';

import 'error.dart';

part 'response.g.dart';

@JsonSerializable()
class GraphQLResponse {
  List<GraphQLError>? errors;
  Map<String, dynamic>? data;

  GraphQLResponse({this.errors, this.data});

  factory GraphQLResponse.fromJson(Map<String, dynamic> json) =>
      _$GraphQLResponseFromJson(json);
}
