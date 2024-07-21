part of 'theme_shared_cubit.dart';

final class ThemeState extends Equatable {
  final ThemeType themeType;

  @override
  List<Object?> get props => [
        themeType,
      ];

  const ThemeState({
    required this.themeType,
  });

  ThemeState copyWith({
    ThemeType? themeType,
  }) {
    return ThemeState(
      themeType: themeType ?? this.themeType,
    );
  }
}
