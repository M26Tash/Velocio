import 'package:velocio/src/core/data/mappers/base_mapper.dart';
import 'package:velocio/src/core/domain/models/message_model/message_model.dart';

final class MessageMapper implements BaseMapper<MessageModel> {
  @override
  Map<String, dynamic> toJson(MessageModel data) {
    return {
      _Fields.messageId: data.messageId,
      _Fields.chatId: data.chatId,
      _Fields.senderId: data.senderId,
      _Fields.content: data.content,
      _Fields.isRead: data.isRead,
      _Fields.createdAt: data.createdAt,
    };
  }

  @override
  MessageModel fromJson(Map<String, dynamic> json) {
    return MessageModel(
      messageId: json[_Fields.messageId],
      chatId: json[_Fields.chatId],
      senderId: json[_Fields.senderId],
      content: json[_Fields.content],
      isRead: json[_Fields.isRead],
      createdAt: json[_Fields.createdAt],
    );
  }
}

abstract final class _Fields {
  static const String messageId = 'message_id';
  static const String chatId = 'chat_id';
  static const String senderId = 'sender_id';
  static const String content = 'content';
  static const String isRead = 'is_read';
  static const String createdAt = 'created_at';
}
