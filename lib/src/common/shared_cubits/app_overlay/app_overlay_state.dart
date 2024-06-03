part of 'app_overlay_cubit.dart';

final class AppOverlayState extends Equatable {
  final SystemUiOverlayStyle? style;
  final bool shouldUpdateRoot;
  final bool shouldReset;

  @override
  List<Object?> get props => [
        style,
        shouldUpdateRoot,
        shouldReset,
      ];

  const AppOverlayState({
    this.style,
    this.shouldUpdateRoot = false,
    this.shouldReset = false,
  });

  AppOverlayState copyWith({
    SystemUiOverlayStyle? style,
    bool? shouldUpdateRoot,
    bool? shouldReset,
  }) {
    return AppOverlayState(
      style: style ?? this.style,
      shouldUpdateRoot: shouldUpdateRoot ?? this.shouldUpdateRoot,
      shouldReset: shouldReset ?? this.shouldReset,
    );
  }
}
