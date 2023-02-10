import 'package:hive/hive.dart';

part 'user_adapter.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final String name;

  User({required this.name});
}
