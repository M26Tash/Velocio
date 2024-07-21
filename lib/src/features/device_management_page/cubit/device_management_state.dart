part of 'device_management_cubit.dart';

final class DeviceManagementState extends Equatable {
  final CustomRoute route;
  @override
  List<Object?> get props => [
        route,
      ];

  const DeviceManagementState({
    required this.route,
  });

  DeviceManagementState copyWith({
    CustomRoute? route,
  }) {
    return DeviceManagementState(
      route: route ?? this.route,
    );
  }
}
