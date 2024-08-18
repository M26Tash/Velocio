// ignore_for_file: avoid_positional_boolean_parameters

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/navigation/configurations.dart';
import 'package:velocio/src/common/navigation/entities/custom_route.dart';
import 'package:velocio/src/core/domain/interactors/data_interactor.dart';
import 'package:velocio/src/core/domain/models/chat_model/chat_model.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final DataInteractor _dataInteractor;
  MainCubit(
    this._dataInteractor,
  ) : super(
          const MainState(
            route: CustomRoute(null, null),
            profile: null,
            chats: null,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<ProfileModel?>? _profileSubscription;
  StreamSubscription<List<ChatModel>?>? _chatSubscription;

  @override
  Future<void> close() {
    _profileSubscription?.cancel();
    _profileSubscription = null;

    _chatSubscription?.cancel();
    _chatSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _chatSubscription?.cancel();
    _chatSubscription = _dataInteractor.chatStream.listen(
      _onNewConversation,
    );

    _profileSubscription?.cancel();

    _profileSubscription = _dataInteractor.profileModelStream.listen(
      _onNewProfileModel,
    );
  }

  Future<void> getProfileModel() async {
    return _dataInteractor.getProfileModel();
  }

  Future<void> getChats() async {
    return _dataInteractor.getChats();
  }

  void _onNewConversation(
    List<ChatModel>? chat,
  ) {
    emit(
      state.copyWith(
        chats: chat,
      ),
    );
  }

  void _onNewProfileModel(ProfileModel? profile) {
    emit(
      state.copyWith(
        profile: profile,
      ),
    );
  }

  void navigateToChatPage({
    required String? chatId,
    required String? receiverName,
    required ProfileModel? profile,
  }) {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          chatConfig(
            chatId: chatId,
            receiverName: receiverName,
            profile: profile,
          ),
        ),
      ),
    );

    _resetRoute();
  }

  void navigateToContactPage() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          contactConfig(),
        ),
      ),
    );

    _resetRoute();
  }

  void navigateToSettingsPage() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          settingsConfig(),
        ),
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
