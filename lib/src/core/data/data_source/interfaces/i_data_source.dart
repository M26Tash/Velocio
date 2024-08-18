import 'package:image_picker/image_picker.dart';
import 'package:velocio/src/core/domain/models/chat_model/chat_model.dart';
import 'package:velocio/src/core/domain/models/message_model/message_model.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';
import 'package:velocio/src/core/domain/models/user_status_model/user_status_model.dart';

abstract interface class IDataSource {
  Stream<String?> get avatarUrlStream;
  Stream<ProfileModel?> get profileModelStream;
  Stream<List<ChatModel>?> get chatStream;
  Stream<List<MessageModel>?> get messagesStream;
  Stream<List<ProfileModel>?> get velocioUsersStream;
  Stream<UserStatusModel?> get userStatusStream;

  Future<void> updateUser({
    required ProfileModel profile,
    required Function(String) onError,
    required Function onSuccess,
  });

  Future<void> uploadAvatar({required XFile file});

  Future<void> getAvatarUrl();

  Future<void> getProfileModel();

  Future<void> getChats();

  Future<void> sendMessage({
    required String chatId,
    required String senderId,
    required String content,
  });

  Future<void> getMessages({
    required String chatId,
  });

  Future<void> findConversation({
    required String personName,
  });

  Future<void> getVelocioUserPhoneNumber({
    required List<String> contactFilter,
  });

  Future<void> getUserStatus({
    required bool isActive,
  });
}
