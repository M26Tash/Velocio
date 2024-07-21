import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocio/src/common/navigation/entities/custom_route.dart';
import 'package:velocio/src/common/utils/extensions/date_time_extension.dart';
import 'package:velocio/src/core/domain/interactors/data_interactor.dart';
import 'package:velocio/src/core/domain/interactors/settings_interactor.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';

part 'my_account_state.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  final DataInteractor _dataInteractor;
  final SettingsInteractor _settingsInteractor;
  MyAccountCubit(
    this._dataInteractor,
    this._settingsInteractor,
  ) : super(
          MyAccountState(
            route: const CustomRoute(null, null),
            profileModel: const ProfileModel().empty(),
            dateTime: null,
            file: null,
            avatarUrl: null,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<XFile?>? _imageSubscription;
  StreamSubscription<String?>? _avatarUrlSubscription;

  @override
  Future<void> close() {
    _imageSubscription?.cancel();
    _imageSubscription = null;

    _avatarUrlSubscription?.cancel();
    _avatarUrlSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _imageSubscription?.cancel();
    _imageSubscription = _settingsInteractor.imageStream.listen(_onNewFile);

    _avatarUrlSubscription?.cancel();
    _avatarUrlSubscription = _dataInteractor.avatarUrlStream.listen(
      _onNewAvatarUrl,
    );
  }

  Future<void> updateUser({
    required ProfileModel profile,
    required Function(String) onError,
    required Function onSuccess,
  }) async {
    profile.copyWith(
      updatedAt: DateTime.now(),
    );
    return _dataInteractor.updateUser(
      profile: profile,
      onError: onError,
      onSuccess: onSuccess,
    );
  }

  Future<void> pickImage() async {
    return _settingsInteractor.pickImage();
  }

  Future<void> uploadAvatar() async {
    return _dataInteractor.uploadAvatar(file: state.file!);
  }

  Future<void> getAvatarUrl() async {
    return _dataInteractor.getAvatarUrl();
  }

  void updateDateTime(DateTime dateTime) {
    final newDate = dateTime.formatWithoutTime();
    emit(
      state.copyWith(
        dateTime: newDate,
      ),
    );
  }

  void updateProfile({
    required ProfileModel profile,
    required Function(String) onError,
    required Function onSuccess,
  }) {
    emit(
      state.copyWith(profileModel: profile),
    );

    updateUser(
      profile: profile,
      onError: onError,
      onSuccess: onSuccess,
    );
  }

  Future<void> _onNewFile(XFile? file) async {
    emit(
      state.copyWith(
        file: file,
      ),
    );

    uploadAvatar();
    await Future.delayed(
      const Duration(milliseconds: 500),
      getAvatarUrl,
    );
  }

  void _onNewAvatarUrl(String? avatarUrl) {
    emit(
      state.copyWith(
        avatarUrl: avatarUrl,
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
