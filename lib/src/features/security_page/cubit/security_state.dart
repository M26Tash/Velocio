part of 'security_cubit.dart';

final class SecurityState extends Equatable {
  final CustomRoute route;
  final bool? isLocalAuth;
  @override
  List<Object?> get props => [
        route,
        isLocalAuth,
      ];

  const SecurityState({
    required this.route,
    required this.isLocalAuth,
  });

  SecurityState copyWith({
    CustomRoute? route,
    bool? isLocalAuth,
  }) {
    return SecurityState(
      route: route ?? this.route,
      isLocalAuth: isLocalAuth ?? this.isLocalAuth,
    );
  }
}
