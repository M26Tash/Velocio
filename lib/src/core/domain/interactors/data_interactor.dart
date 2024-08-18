import 'package:image_picker/image_picker.dart';
import 'package:velocio/src/core/domain/interfaces/i_auth_repository.dart';
import 'package:velocio/src/core/domain/interfaces/i_data_repository.dart';
import 'package:velocio/src/core/domain/models/chat_model/chat_model.dart';
import 'package:velocio/src/core/domain/models/message_model/message_model.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';
import 'package:velocio/src/core/domain/models/user_status_model/user_status_model.dart';

final class DataInteractor {
  final IDataRepository _dataRepository;
  final IAuthRepository _authRepository;

  DataInteractor(
    this._dataRepository,
    this._authRepository,
  );

  String? get userId => _authRepository.userId;

  Stream<String?> get avatarUrlStream => _dataRepository.avatarUrlStream;

  Stream<ProfileModel?> get profileModelStream =>
      _dataRepository.profileModelStream;

  Stream<List<ChatModel>?> get chatStream => _dataRepository.chatStream;

  Stream<List<MessageModel>?> get messagesStream =>
      _dataRepository.messagesStream;

  Stream<List<ProfileModel>?> get velocioUsersStream =>
      _dataRepository.velocioUsersStream;

  Stream<UserStatusModel?> get userStatusStream =>
      _dataRepository.userStatusStream;

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

  Future<void> getChats() async {
    return _dataRepository.getChats();
  }

  Future<void> sendMessage({
    required String chatId,
    required String senderId,
    required String content,
  }) async {
    return _dataRepository.sendMessage(
      chatId: chatId,
      senderId: senderId,
      content: content,
    );
  }

  Future<void> getMessages({
    required String chatId,
  }) async {
    return _dataRepository.getMessages(
      chatId: chatId,
    );
  }

  Future<void> findConversation({
    required String personName,
  }) async {
    return _dataRepository.findConversation(
      personName: personName,
    );
  }

  Future<void> getVelocioUserPhoneNumber({
    required List<String> contactFilter,
  }) async {
    return _dataRepository.getVelocioUserPhoneNumber(
      contactFilter: contactFilter,
    );
  }

  Future<void> getUserStatus({required bool isActive}) async {
    return _dataRepository.getUserStatus(
      isActive: isActive,
    );
  }
}
