part of 'auth_cubit.dart';

final class AuthState extends Equatable {
  final CustomRoute route;
  final ProfileModel? profileModel;
  @override
  List<Object?> get props => [
        route,
        profileModel,
      ];

  const AuthState({
    required this.route,
    required this.profileModel,
  });

  AuthState copyWith({
    CustomRoute? route,
    ProfileModel? profileModel,
  }) {
    return AuthState(
      route: route ?? this.route,
      profileModel: profileModel ?? this.profileModel,
    );
  }
}
