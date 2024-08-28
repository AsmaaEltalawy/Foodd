import 'package:hive/hive.dart';
part "database_model.g.dart";
@HiveType(typeId: 0)
class ContactsModel extends HiveObject {
  @HiveType(typeId: 0)
  final String name;

  @HiveType(typeId: 1)
  String number;

  @HiveType(typeId: 2)
  String email;

  ContactsModel(
      {required this.name, required this.number, required this.email});
}
