import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/navigation/entities/custom_route.dart';

part 'navigation_panel_state.dart';

class NavigationPanelCubit extends Cubit<NavigationPanelState> {
  final _navigationStack = <int>[];

  NavigationPanelCubit()
      : super(
          const NavigationPanelState(
            route: CustomRoute(null, null),
            navigationIndex: 0,
            isMainPage: false,
          ),
        );

  bool onWillPop() {
    if (_navigationStack.isEmpty) return true;

    final lastNavigationIndex = _navigationStack.removeLast();

    if (state.navigationIndex == 0) return true;

    emit(
      state.copyWith(navigationIndex: lastNavigationIndex),
    );

    return false;
  }

  void updateNavigationIndex(int navigationIndex, {bool? isMainPage}) {
    _navigationStack.add(state.navigationIndex);

    if (navigationIndex == 2) {}
    emit(
      state.copyWith(
        navigationIndex: navigationIndex,
        isMainPage: isMainPage ?? state.isMainPage,
      ),
    );
  }
}
