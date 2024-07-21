part of 'reset_password_cubit.dart';

final class ResetPasswordState extends Equatable {
  final CustomRoute route;
  final String email;
  @override
  List<Object?> get props => [
        route,
        email,
      ];

  const ResetPasswordState({
    required this.route,
    required this.email,
  });

  ResetPasswordState copyWith({
    CustomRoute? route,
    String? email,
  }) {
    return ResetPasswordState(
      route: route ?? this.route,
      email: email ?? this.email,
    );
  }
}
