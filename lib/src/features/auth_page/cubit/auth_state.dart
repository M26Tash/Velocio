part of 'auth_cubit.dart';

final class AuthState extends Equatable {
  final CustomRoute route;
  @override
  List<Object?> get props => [
        route,
      ];

  const AuthState({
    required this.route,
  });

  AuthState copyWith({
    CustomRoute? route,
  }) {
    return AuthState(
      route: route ?? this.route,
    );
  }
}
