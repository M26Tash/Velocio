import 'package:image_picker/image_picker.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';

abstract interface class IDataSource {
  Stream<String?> get avatarUrlStream;
  Stream<ProfileModel?> get profileModelStream;
  Stream<List<Map<String, dynamic>>?> get messagesStream;

  Future<void> updateUser({
    required ProfileModel profile,
    required Function(String) onError,
    required Function onSuccess,
  });

  Future<void> uploadAvatar({required XFile file});

  Future<void> getAvatarUrl();

  Future<void> getProfileModel();

  Future<void> sendMessage({
    required String senderId,
    required String receiverId,
    required String content,
  });

  Future<void> getMessages({
    required String senderId,
    required String receiverId,

  });
}
