import 'package:image_picker/image_picker.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_data_source.dart';
import 'package:velocio/src/core/domain/interfaces/i_data_repository.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';

final class DataRepository implements IDataRepository {
  final IDataSource _dataSource;

  DataRepository(this._dataSource);

  @override
  Stream<String?> get avatarUrlStream => _dataSource.avatarUrlStream;

  @override
  Stream<ProfileModel?> get profileModelStream =>
      _dataSource.profileModelStream;

  @override
  Stream<List<Map<String, dynamic>>?> get messagesStream =>
      _dataSource.messagesStream;

  @override
  Future<void> updateUser({
    required ProfileModel profile,
    required Function(String) onError,
    required Function onSuccess,
  }) async {
    return _dataSource.updateUser(
      profile: profile,
      onError: onError,
      onSuccess: onSuccess,
    );
  }

  @override
  Future<void> uploadAvatar({required XFile file}) async {
    return _dataSource.uploadAvatar(file: file);
  }

  @override
  Future<void> getAvatarUrl() async {
    return _dataSource.getAvatarUrl();
  }

  @override
  Future<void> getProfileModel() async {
    return _dataSource.getProfileModel();
  }

  @override
  Future<void> sendMessage({
    required String senderId,
    required String receiverId,
    required String content,
  }) async {
    return _dataSource.sendMessage(
      senderId: senderId,
      receiverId: receiverId,
      content: content,
    );
  }

  @override
  Future<void> getMessages({
    required String senderId,
    required String receiverId,
  }) async {
    return _dataSource.getMessages(
      senderId: senderId,
      receiverId: receiverId,
    );
  }
}
