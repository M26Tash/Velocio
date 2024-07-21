

import 'package:fast_contacts/fast_contacts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_settings_data_source.dart';

class SettingsDataSource implements ISettingsDataSource {
  final BehaviorSubject<List<Contact>?> _contactSubject = BehaviorSubject();

  final BehaviorSubject<XFile?> _imageSubject = BehaviorSubject();

  @override
  Stream<List<Contact>?> get contactStream => _contactSubject;

  @override
  Stream<XFile?> get imageStream => _imageSubject;

  @override
  Future<void> getContacts() async {
    await Permission.contacts.request();

    final contactStatus = await Permission.contacts.status;

    if (contactStatus.isGranted) {
      final contacts = await FastContacts.getAllContacts();

      _contactSubject.add(contacts);
    }
  }

  @override
  Future<void> pickImage() async {
    final picker = ImagePicker();

    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    final imageTemp = XFile(image.path);

    _imageSubject.add(imageTemp);
  }
}
