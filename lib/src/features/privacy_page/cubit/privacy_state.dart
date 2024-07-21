part of 'privacy_cubit.dart';

final class PrivacyState extends Equatable {
  final CustomRoute route;
  @override
  List<Object?> get props => [
        route,
      ];

  const PrivacyState({
    required this.route,
  });

  PrivacyState copyWith({
    CustomRoute? route,
  }) {
    return PrivacyState(
      route: route ?? this.route,
    );
  }
}
