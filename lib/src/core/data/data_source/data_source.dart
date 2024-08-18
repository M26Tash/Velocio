// ignore: lines_longer_than_80_chars
// ignore_for_file: avoid_dynamic_calls, avoid_redundant_argument_values, cascade_invocations

import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_auth_data_source.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_data_source.dart';
import 'package:velocio/src/core/data/mappers/chat_mapper/chat_mapper.dart';
import 'package:velocio/src/core/data/mappers/message_mapper/message_mapper.dart';
import 'package:velocio/src/core/data/mappers/profile_mapper/profile_mapper.dart';
import 'package:velocio/src/core/domain/models/chat_model/chat_model.dart';
import 'package:velocio/src/core/domain/models/message_model/message_model.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';
import 'package:velocio/src/core/domain/models/user_status_model/user_status_model.dart';
import 'package:velocio/src/core/domain/utils/custom_logger.dart';

class DataSource implements IDataSource {
  final IAuthDataSource _authDataSource;

  DataSource(this._authDataSource);

  final supabase = Supabase.instance.client;

  final BehaviorSubject<String?> _avatarUrlSubject = BehaviorSubject();

  final BehaviorSubject<ProfileModel?> _profileModelSubject = BehaviorSubject();

  final BehaviorSubject<List<ChatModel>?> _chatSubject = BehaviorSubject();

  final BehaviorSubject<List<MessageModel>?> _messagesSubject =
      BehaviorSubject();

  final BehaviorSubject<List<ProfileModel>?> _velocioUsersSubject =
      BehaviorSubject();

  final BehaviorSubject<UserStatusModel?> _userStatusSubject =
      BehaviorSubject();

  @override
  Stream<String?> get avatarUrlStream => _avatarUrlSubject;

  @override
  Stream<ProfileModel?> get profileModelStream => _profileModelSubject;

  @override
  Stream<List<ChatModel>?> get chatStream => _chatSubject;

  @override
  Stream<List<MessageModel>?> get messagesStream => _messagesSubject;

  @override
  Stream<List<ProfileModel>?> get velocioUsersStream => _velocioUsersSubject;

  @override
  Stream<UserStatusModel?> get userStatusStream => _userStatusSubject;

  String? get userId => _authDataSource.userId;

  @override
  Future<void> updateUser({
    required ProfileModel profile,
    required Function(String) onError,
    required Function onSuccess,
  }) async {
    try {
      await supabase
          .from('profiles')
          .update(ProfileMapper().toJson(profile))
          .eq(
            'id',
            userId!,
          );

      onSuccess();
    } on StorageException catch (e) {
      CustomLogger.errorLog(
        'updateUser',
        params: {'Caught error': e.message},
      );

      onError(e.message);
    }
  }

  @override
  Future<void> uploadAvatar({required XFile file}) async {
    final avatarPath = '/$userId/avatar';

    final imageExtension = file.path.split('.').last.toLowerCase();
    final imageBytes = await file.readAsBytes();
    try {
      // UPLOADING IMAGE
      await supabase.storage.from('avatars').uploadBinary(
            avatarPath,
            imageBytes,
            fileOptions: FileOptions(
              upsert: true,
              contentType: 'image/$imageExtension',
            ),
          );

      // GETTING IMAGE
      final url = await supabase.storage.from('avatars').createSignedUrl(
            avatarPath,
            31536000,
          );

      _avatarUrlSubject.add(url);
    } on StorageException catch (e) {
      CustomLogger.errorLog(
        'uploadAvatar',
        params: {'Caught error': e.message},
      );
    }
  }

  @override
  Future<void> getAvatarUrl() async {
    try {
      // final avatarPath = '/$userId/avatar';

      // final url = await supabase.storage.from('avatars').createSignedUrl(
      //       avatarPath,
      //       31536000,
      //     );

      // _avatarUrlSubject.add(url);
    } on StorageException catch (e) {
      CustomLogger.errorLog(
        'getAvatarUrl',
        params: {'Caught error': e.message},
      );
    }
  }

  @override
  Future<void> getProfileModel() async {
    try {
      final profileModel = await supabase.from('profiles').select().eq(
            'id',
            userId!,
          );

      final profile = profileModel
          .map(
            (e) => ProfileMapper().fromJson(e),
          )
          .toList();

      _profileModelSubject.add(profile.first);
    } on StorageException catch (e) {
      CustomLogger.errorLog(
        'getProfileModel',
        params: {'Caught error': e.message},
      );
    }
  }

  @override
  Future<void> getChats() async {
    try {
      supabase.from('chats').stream(primaryKey: ['chat_id']).listen(
        (event) async {
          final chatMap = <String, ChatModel>{};

          for (final conversation in event) {
            final initialChat = ChatMapper().fromJson(conversation);

            if (initialChat.firstUserId != userId &&
                initialChat.secondUserId != userId) {
              continue;
            }

            final otherUserId = initialChat.firstUserId == userId
                ? initialChat.secondUserId
                : initialChat.firstUserId;

            final otherUserProfile = await _fetchProfile(otherUserId);

            final finalChat = initialChat.copyWith(profile: otherUserProfile);

            chatMap[finalChat.chatId] = finalChat;
          }

          final updatedConversations = chatMap.values.toList();

          updatedConversations
              .sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

          _chatSubject.add(updatedConversations);
        },
      );
    } on PostgrestException catch (e) {
      CustomLogger.errorLog(
        'getChats',
        params: {'Caught error': e.message},
      );
    }
  }

  Future<ProfileModel> _fetchProfile(String userId) async {
    final profile = await supabase.from('profiles').select().eq('id', userId);
    return ProfileMapper().fromJson(profile.first);
  }

  @override
  Future<void> sendMessage({
    required String chatId,
    required String senderId,
    required String content,
  }) async {
    final nowUtc = DateTime.now().toUtc().toIso8601String();
    try {
      await supabase.from('messages').insert({
        'chat_id': chatId,
        'sender_id': senderId,
        'content': content,
        'created_at': nowUtc,
      });

      _updateChat(
        chatId: chatId,
        content: content,
        createdAt: nowUtc,
      );
    } on PostgrestException catch (e) {
      CustomLogger.errorLog(
        'sendMessage',
        params: {'Caught error': e.message},
      );
    }
  }

  @override
  Future<void> getMessages({
    required String chatId,
  }) async {
    try {
      _messagesSubject.add(null);

      supabase
          .from('messages')
          .stream(primaryKey: ['id'])
          .eq('chat_id', chatId)
          .order('created_at', ascending: false)
          .listen(
            (event) {
              final newMessages = event
                  .map(
                    (message) => MessageMapper().fromJson(message),
                  )
                  .toList();

              _messagesSubject.add(newMessages);
            },
          );
    } on PostgrestException catch (e) {
      CustomLogger.errorLog(
        'sendMessage',
        params: {'Caught error': e.message},
      );
    }
  }

  @override
  Future<void> findConversation({required String personName}) async {
    try {
      // final foundConversation =
      //     await supabase.from('conversations').select().textSearch(
      //           'receiver_name',
      //           personName,
      //         );

      // final newConversations = foundConversation
      //     .map(
      //       (e) => ConversationMapper().fromJson(e),
      //     )
      //     .toList();

      // _conversationSubject.add(newConversations);
    } on PostgrestException catch (e) {
      CustomLogger.errorLog(
        'findConversation',
        params: {'Caught error': e.message},
      );
    }
  }

  @override
  Future<void> getVelocioUserPhoneNumber({
    required List<dynamic> contactFilter,
  }) async {
    try {
      final contacts = await supabase.from('profiles').select().inFilter(
            'phone_number',
            contactFilter,
          );

      final contactModel = contacts
          .map(
            (contact) => ProfileMapper().fromJson(contact),
          )
          .toList();

      _velocioUsersSubject.add(contactModel);
    } on PostgrestException catch (e) {
      CustomLogger.errorLog(
        'getVelocioUserPhoneNumber',
        params: {'Caught error': e.message},
      );
    }
  }

  Future<void> _updateChat({
    required String chatId,
    required String content,
    required String createdAt,
  }) async {
    try {
      await supabase.from('chats').update({
        'last_message': content,
        'created_at': createdAt,
      }).eq(
        'chat_id',
        chatId,
      );
    } on PostgrestException catch (e) {
      CustomLogger.errorLog(
        '_updateChat',
        params: {'Caught error': e.message},
      );
    }
  }

  @override
  Future<void> getUserStatus({
    required bool isActive,
  }) async {
    final nowUtc = DateTime.now().toUtc().toIso8601String();
    try {
      if (userId!.isEmpty) {
        CustomLogger.warningLog(
          'getUserStatus',
          params: {'Caught error': 'userId is empty'},
        );
      } else {
        await supabase.from('user_status').upsert(
          {
            'user_id': userId,
            'is_active': isActive,
            'last_active': nowUtc,
          },
        );

        await supabase.from('profiles').update({
          'is_active': isActive,
          'last_active': nowUtc,
        }).eq('id', userId!);
      }
    } on PostgrestException catch (e) {
      CustomLogger.errorLog(
        'getUserStatus',
        params: {'Caught error': e.message},
      );
    }
  }
}
