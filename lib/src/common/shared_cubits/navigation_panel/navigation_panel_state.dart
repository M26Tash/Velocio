part of 'navigation_panel_cubit.dart';

final class NavigationPanelState extends Equatable {
  final CustomRoute route;
  final int navigationIndex;
  final bool isMainPage;

  @override
  List<Object?> get props => [
        navigationIndex,
      ];

  const NavigationPanelState({
    required this.route,
    required this.navigationIndex,
    required this.isMainPage,
  });

  NavigationPanelState copyWith({
    CustomRoute? route,
    int? navigationIndex,
    bool? isMainPage,
  }) {
    return NavigationPanelState(
      route: route ?? this.route,
      navigationIndex: navigationIndex ?? this.navigationIndex,
      isMainPage: isMainPage ?? this.isMainPage,
    );
  }
}
