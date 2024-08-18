import 'package:image_picker/image_picker.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_data_source.dart';
import 'package:velocio/src/core/domain/interfaces/i_data_repository.dart';
import 'package:velocio/src/core/domain/models/chat_model/chat_model.dart';
import 'package:velocio/src/core/domain/models/message_model/message_model.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';
import 'package:velocio/src/core/domain/models/user_status_model/user_status_model.dart';

final class DataRepository implements IDataRepository {
  final IDataSource _dataSource;

  DataRepository(this._dataSource);

  @override
  Stream<String?> get avatarUrlStream => _dataSource.avatarUrlStream;

  @override
  Stream<ProfileModel?> get profileModelStream =>
      _dataSource.profileModelStream;

  @override
  Stream<List<ChatModel>?> get chatStream => _dataSource.chatStream;

  @override
  Stream<List<MessageModel>?> get messagesStream => _dataSource.messagesStream;

  @override
  Stream<List<ProfileModel>?> get velocioUsersStream =>
      _dataSource.velocioUsersStream;

  @override
  Stream<UserStatusModel?> get userStatusStream => _dataSource.userStatusStream;

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
  Future<void> getChats() async {
    return _dataSource.getChats();
  }

  @override
  Future<void> sendMessage({
    required String chatId,
    required String senderId,
    required String content,
  }) async {
    return _dataSource.sendMessage(
      chatId: chatId,
      senderId: senderId,
      content: content,
    );
  }

  @override
  Future<void> getMessages({
    required String chatId,
  }) async {
    return _dataSource.getMessages(
      chatId: chatId,
    );
  }

  @override
  Future<void> findConversation({
    required String personName,
  }) async {
    return _dataSource.findConversation(
      personName: personName,
    );
  }

  @override
  Future<void> getVelocioUserPhoneNumber({
    required List<String> contactFilter,
  }) async {
    return _dataSource.getVelocioUserPhoneNumber(
      contactFilter: contactFilter,
    );
  }

  @override
  Future<void> getUserStatus({required bool isActive}) async {
    return _dataSource.getUserStatus(
      isActive: isActive,
    );
  }
}
