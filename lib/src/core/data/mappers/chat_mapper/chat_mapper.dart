import 'package:velocio/src/core/data/mappers/base_mapper.dart';
import 'package:velocio/src/core/domain/models/chat_model/chat_model.dart';

final class ChatMapper implements BaseMapper<ChatModel> {
  @override
  Map<String, dynamic> toJson(ChatModel data) {
    return {
      _Fields.chatId: data.chatId,
      _Fields.firstUserId: data.firstUserId,
      _Fields.secondUserId: data.secondUserId,
      _Fields.lastMessage: data.lastMessage,
      _Fields.createdAt: data.createdAt,
    };
  }

  @override
  ChatModel fromJson(Map<String, dynamic> json) {
    return ChatModel(
      chatId: json[_Fields.chatId],
      firstUserId: json[_Fields.firstUserId],
      secondUserId: json[_Fields.secondUserId],
      lastMessage: json[_Fields.lastMessage],
      createdAt: json[_Fields.createdAt],
      profile: null,
    );
  }
}

abstract final class _Fields {
  static const String chatId = 'chat_id';
  static const String firstUserId = 'first_user_id';
  static const String secondUserId = 'second_user_id';
  static const String lastMessage = 'last_message';
  static const String createdAt = 'created_at';
}
