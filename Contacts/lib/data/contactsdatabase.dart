import 'package:contacts/data/models/database_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
class ContactsDataBase {
  final box = Hive.box<ContactsModel>('contactsBox');

  List<ContactsModel> loadContacts() {
    return box.values.toList(); // جلب البيانات مباشرة من Hive
  }

  void addContact(ContactsModel contact) {
    box.add(contact); // إضافة الاتصال لـ Hive
  }

  void updateContact(int index, ContactsModel updatedContact) {
    box.putAt(index, updatedContact); // تحديث الاتصال
  }

  void delete(int index) {
    box.deleteAt(index); // حذف الاتصال من Hive
  }
}
