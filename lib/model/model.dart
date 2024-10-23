import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class Student {
  @HiveField(0)
  String? imagePath;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? age;
  @HiveField(3)
  String? classs;
  @HiveField(4)
  String? address;

  Student({
    required this.imagePath,
    required this.name,
    required this.age,
    required this.classs,
    required this.address,
  });
}
