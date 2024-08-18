part of 'main_cubit.dart';

final class MainState extends Equatable {
  final CustomRoute route;
  final ProfileModel? profile;
  final List<ChatModel>? chats;

  @override
  List<Object?> get props => [
        route,
        profile,
        chats,
      ];

  const MainState({
    required this.route,
    required this.profile,
    required this.chats,
  });

  MainState copyWith({
    CustomRoute? route,
    ProfileModel? profile,
    List<ChatModel>? chats,
  }) {
    return MainState(
      route: route ?? this.route,
      profile: profile ?? this.profile,
      chats: chats ?? this.chats,
    );
  }
}
