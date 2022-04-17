import 'package:json_annotation/json_annotation.dart';

part 'moment.g.dart';

@JsonSerializable(createToJson: false)
class Moment {
  final String id;
  final String userId;
  final DateTime createdAt;
  final String? title;
  final String? content;
  final List<String>? storages;

  Moment({
    required this.id,
    required this.userId,
    required this.createdAt,
    this.title,
    this.content,
    this.storages,
  });

  factory Moment.fromJson(Map<String, dynamic> json) => _$MomentFromJson(json);
}
