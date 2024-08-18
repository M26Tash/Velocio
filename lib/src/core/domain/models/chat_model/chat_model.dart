import 'package:velocio/src/core/domain/models/domain_object.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';

final class ChatModel extends DomainObject {
  final String chatId;
  final String firstUserId;
  final String secondUserId;
  final String? lastMessage;
  final String? createdAt;
  final ProfileModel? profile;

  @override
  List<Object?> get props => [
        chatId,
        firstUserId,
        secondUserId,
        lastMessage,
        createdAt,
        profile,
      ];

  const ChatModel({
    required this.chatId,
    required this.firstUserId,
    required this.secondUserId,
    required this.lastMessage,
    required this.createdAt,
    required this.profile,
  });

  @override
  ChatModel copyWith({
    ProfileModel? profile,
  }) {
    return ChatModel(
      chatId: chatId,
      firstUserId: firstUserId,
      secondUserId: secondUserId,
      lastMessage: lastMessage,
      createdAt: createdAt,
      profile: profile ?? this.profile,
    );
  }
}
