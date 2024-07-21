import 'package:fast_contacts/fast_contacts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_settings_data_source.dart';
import 'package:velocio/src/core/domain/interfaces/i_settings_repository.dart';

final class SettingsRepository implements ISettingsRepository {
  final ISettingsDataSource _settingsDataSource;

  SettingsRepository(this._settingsDataSource);

  @override
  Stream<List<Contact>?> get contactStream => _settingsDataSource.contactStream;

  @override
  Stream<XFile?> get imageStream => _settingsDataSource.imageStream;

  @override
  Future<void> getContacts() async {
    return _settingsDataSource.getContacts();
  }

  @override
  Future<void> pickImage() async {
    return _settingsDataSource.pickImage();
  }
}
