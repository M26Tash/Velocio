part of 'settings_cubit.dart';

final class SettingsState extends Equatable {
  final CustomRoute route;
  final String? avatarUrl;
  final String? fullName;
  final ProfileModel? profileModel;
  @override
  List<Object?> get props => [
        route,
        avatarUrl,
        fullName,
        profileModel,
      ];

  const SettingsState({
    required this.route,
    required this.avatarUrl,
    required this.fullName,
    required this.profileModel,
  });

  SettingsState copyWith({
    CustomRoute? route,
    String? avatarUrl,
    String? fullName,
    ProfileModel? profileModel,
  }) {
    return SettingsState(
      route: route ?? this.route,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      fullName: fullName ?? this.fullName,
      profileModel: profileModel ?? this.profileModel,
    );
  }
}
