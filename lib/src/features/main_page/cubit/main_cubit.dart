// ignore_for_file: avoid_positional_boolean_parameters

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/navigation/configurations.dart';
import 'package:velocio/src/common/navigation/entities/custom_route.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(
          const MainState(
            route: CustomRoute(null, null),
          ),
        );

  void navigateToChatPage() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          chatConfig(),
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
