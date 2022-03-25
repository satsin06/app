import 'package:hive/hive.dart';

part 'file.g.dart';

@HiveType(typeId: 5)
class File {
  @HiveField(0)
  late String path;

  @HiveField(1)
  late String url;
}
