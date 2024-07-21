import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/navigation/entities/custom_route.dart';

part 'device_management_state.dart';

class DeviceManagementCubit extends Cubit<DeviceManagementState> {
  DeviceManagementCubit()
      : super(
          const DeviceManagementState(
            route: CustomRoute(null, null),
          ),
        );

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
