import 'package:fast_contacts/fast_contacts.dart';
import 'package:image_picker/image_picker.dart';

abstract interface class ISettingsRepository {
  Stream<List<Contact>?> get contactStream;

  Stream<XFile?> get imageStream;

  Future<void> getContacts();

  Future<void> pickImage();
}
