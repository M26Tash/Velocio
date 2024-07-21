import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/navigation/entities/custom_route.dart';
import 'package:velocio/src/core/domain/interactors/data_interactor.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final DataInteractor _dataInteractor;
  ChatCubit(this._dataInteractor)
      : super(
          const ChatState(route: CustomRoute(null, null), messages: null),
        ) {
    _subscribeAll();
  }

  StreamSubscription<List<Map<String, dynamic>>?>? _messagesSubscription;

  @override
  Future<void> close() {
    _messagesSubscription?.cancel();
    _messagesSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _messagesSubscription?.cancel();
    _messagesSubscription = _dataInteractor.messagesStream.listen(
      _onNewAvatarUrl,
    );
  }

  Future<void> sendMessage({
    required String senderId,
    required String receiverId,
    required String content,
  }) async {
    return _dataInteractor.sendMessage(
      senderId: senderId,
      receiverId: receiverId,
      content: content,
    );
  }

  Future<void> getMessages({
    required String senderId,
    required String receiverId,
  }) async {
    return _dataInteractor.getMessages(
      senderId: senderId,
      receiverId: receiverId,
    );
  }

  void _onNewAvatarUrl(List<Map<String, dynamic>>? messages) {
    emit(
      state.copyWith(
        messages: messages,
      ),
    );
  }

  void onBackTap() {
    emit(
      state.copyWith(
        route: const CustomRoute.pop(),
      ),
    );

    _resetRoute();
  }

  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomRoute(null, null),
      ),
    );
  }
}
