import 'package:fast_contacts/fast_contacts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocio/src/core/domain/interfaces/i_settings_repository.dart';

final class SettingsInteractor {
  final ISettingsRepository _settingsRepository;

  SettingsInteractor(
    this._settingsRepository,
  );

  Stream<List<Contact>?> get contactStream => _settingsRepository.contactStream;

  Stream<XFile?> get imageStream => _settingsRepository.imageStream;

  Future<void> getContacts() async {
    return _settingsRepository.getContacts();
  }

  Future<void> pickImage() async {
    return _settingsRepository.pickImage();
  }
}
