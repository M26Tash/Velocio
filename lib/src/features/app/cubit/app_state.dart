part of 'app_cubit.dart';

final class AppState extends Equatable {
  final ThemeType themeType;

  @override
  List<Object?> get props => [
        themeType,
      ];

  const AppState({
    required this.themeType,
  });

  AppState copyWith({ThemeType? themeType}) {
    return AppState(
      themeType: themeType ?? this.themeType,
    );
  }
}
