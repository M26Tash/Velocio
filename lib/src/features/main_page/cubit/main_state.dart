part of 'main_cubit.dart';

final class MainState extends Equatable {
  final CustomRoute route;
  @override
  List<Object?> get props => [
        route,
      ];

  const MainState({
    required this.route,
  });

  MainState copyWith({
    CustomRoute? route,
  }) {
    return MainState(
      route: route ?? this.route,
    );
  }
}
