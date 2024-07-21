import 'package:image_picker/image_picker.dart';
import 'package:velocio/src/core/domain/interfaces/i_data_repository.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';

final class DataInteractor {
  final IDataRepository _dataRepository;

  DataInteractor(this._dataRepository);

  Stream<String?> get avatarUrlStream => _dataRepository.avatarUrlStream;

  Stream<ProfileModel?> get profileModelStream =>
      _dataRepository.profileModelStream;

  Stream<List<Map<String, dynamic>>?> get messagesStream =>
      _dataRepository.messagesStream;

  Future<void> updateUser({
    required ProfileModel profile,
    required Function(String) onError,
    required Function onSuccess,
  }) async {
    return _dataRepository.updateUser(
      profile: profile,
      onError: onError,
      onSuccess: onSuccess,
    );
  }

  Future<void> uploadAvatar({required XFile file}) async {
    return _dataRepository.uploadAvatar(
      file: file,
    );
  }

  Future<void> getAvatarUrl() async {
    return _dataRepository.getAvatarUrl();
  }

  Future<void> getProfileModel() async {
    return _dataRepository.getProfileModel();
  }

  Future<void> sendMessage({
    required String senderId,
    required String receiverId,
    required String content,
  }) async {
    return _dataRepository.sendMessage(
      senderId: senderId,
      receiverId: receiverId,
      content: content,
    );
  }

  Future<void> getMessages({
    required String senderId,
    required String receiverId,
  }) async {
    return _dataRepository.getMessages(
      senderId: senderId,
      receiverId: receiverId,
    );
  }
}
