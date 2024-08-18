import 'package:velocio/src/core/domain/models/domain_object.dart';

final class MessageModel extends DomainObject {
  final String messageId;
  final String chatId;
  final String senderId;
  final String content;
  final bool isRead;
  final String createdAt;

  @override
  List<Object?> get props => [
        messageId,
        chatId,
        senderId,
        content,
        isRead,
        createdAt,
      ];

  const MessageModel({
    required this.messageId,
    required this.chatId,
    required this.senderId,
    required this.content,
    required this.isRead,
    required this.createdAt,
  });

  @override
  MessageModel copyWith() {
    return MessageModel(
      messageId: messageId,
      chatId: chatId,
      senderId: senderId,
      content: content,
      isRead: isRead,
      createdAt: createdAt,
    );
  }
}
