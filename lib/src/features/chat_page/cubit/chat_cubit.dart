// ignore_for_file: unused_element

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/navigation/entities/custom_route.dart';
import 'package:velocio/src/core/domain/interactors/data_interactor.dart';
import 'package:velocio/src/core/domain/models/message_model/message_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final DataInteractor _dataInteractor;
  ChatCubit(this._dataInteractor)
      : super(
          const ChatState(
            route: CustomRoute(null, null),
            messages: null,
            isButtonActive: false,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<List<MessageModel>?>? _messagesSubscription;

  String? get userId => _dataInteractor.userId;

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
    required String chatId,
    required String senderId,
    required String content,
  }) async {
    return _dataInteractor.sendMessage(
      chatId: chatId,
      senderId: senderId,
      content: content,
    );
  }

  Future<void> getMessages({
    required String chatId,
  }) async {
    return _dataInteractor.getMessages(
      chatId: chatId,
    );
  }

  void _onNewAvatarUrl(List<MessageModel>? messages) {
    emit(
      state.copyWith(
        messages: messages,
      ),
    );
  }
  // void _onNewAvatarUrl(List<MessageModel>? messages) {
  //   emit(
  //     state.copyWith(
  //       messages: messages,
  //     ),
  //   );
  // }

  void updateActiveButton({required bool isButtonActive}) {
    emit(
      state.copyWith(
        isButtonActive: isButtonActive,
      ),
    );
  }

  void onBackTap() {
    emit(
      state.copyWith(
        route: const CustomRoute.pop(),
      ),
    );

  }

  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomRoute(null, null),
      ),
    );
  }
}
