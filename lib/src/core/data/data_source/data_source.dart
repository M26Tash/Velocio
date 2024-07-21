// ignore_for_file: avoid_dynamic_calls

import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_auth_data_source.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_data_source.dart';
import 'package:velocio/src/core/data/mappers/profile_mapper/profile_mapper.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';
import 'package:velocio/src/core/domain/utils/custom_logger.dart';

class DataSource implements IDataSource {
  final IAuthDataSource _authDataSource;

  DataSource(this._authDataSource);

  final supabase = Supabase.instance.client;

  final BehaviorSubject<String?> _avatarUrlSubject = BehaviorSubject();

  final BehaviorSubject<ProfileModel?> _profileModelSubject = BehaviorSubject();

  final BehaviorSubject<List<Map<String, dynamic>>?> _messagesSubject =
      BehaviorSubject();

  @override
  Stream<String?> get avatarUrlStream => _avatarUrlSubject;

  @override
  Stream<ProfileModel?> get profileModelStream => _profileModelSubject;

  @override
  Stream<List<Map<String, dynamic>>?> get messagesStream => _messagesSubject;

  String get userId => _authDataSource.userId!;

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
            userId,
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
      await supabase.storage.from('avatars').uploadBinary(
            avatarPath,
            imageBytes,
            fileOptions: FileOptions(
              upsert: true,
              contentType: 'image/$imageExtension',
            ),
          );
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
      final avatarPath = '/$userId/avatar';

      final url = await supabase.storage.from('avatars').createSignedUrl(
            avatarPath,
            31536000,
          );

      _avatarUrlSubject.add(url);
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
            userId,
          );

      final profile = profileModel
          .map(
            (e) => ProfileMapper().fromJson(e),
          )
          .toList();

      _profileModelSubject.add(profile.first);
    } on StorageException catch (e) {
      CustomLogger.errorLog(
        'getFullName',
        params: {'Caught error': e.message},
      );
    }
  }

  @override
  Future<void> sendMessage({
    required String senderId,
    required String receiverId,
    required String content,
  }) async {
    try {
      await supabase.from('messages').insert({
        'sender_id': senderId,
        'receiver_id': receiverId,
        'content': content,
        'created_at': DateTime.now().toUtc().toIso8601String(),
      });
    } on PostgrestException catch (e) {
      CustomLogger.errorLog(
        'sendMessage',
        params: {'Caught error': e.message},
      );
    }
  }

  @override
  Future<void> getMessages({
    required String senderId,
    required String receiverId,
  }) async {
    try {
      supabase.from('messages').stream(primaryKey: ['id']).inFilter(
        'receiver_id',
        [senderId, receiverId],
      ).listen(
        (event) {
          final filteredMessages = event
              .where(
                (message) =>
                    (message['sender_id'] == senderId &&
                        message['receiver_id'] == receiverId) ||
                    (message['sender_id'] == receiverId &&
                        message['receiver_id'] == senderId),
              )
              .toList()
              .reversed
              .toList();

          _messagesSubject.add(filteredMessages);
        },
      );
    } on PostgrestException catch (e) {
      CustomLogger.errorLog(
        'sendMessage',
        params: {'Caught error': e.message},
      );
    }
  }
}
