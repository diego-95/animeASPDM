import 'package:hive/hive.dart';

part 'meta_adapter.g.dart';

@HiveType(typeId: 3)
class Meta {
  @HiveField(0)
  final int malId;
  @HiveField(1)
  final String type;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String url;

  Meta(
      {required this.malId,
      required this.type,
      required this.name,
      required this.url});
}
