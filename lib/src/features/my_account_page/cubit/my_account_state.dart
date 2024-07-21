part of 'my_account_cubit.dart';

final class MyAccountState extends Equatable {
  final CustomRoute route;
  final ProfileModel profileModel;
  final String? dateTime;
  final XFile? file;
  final String? avatarUrl;
  @override
  List<Object?> get props => [
        route,
        profileModel,
        dateTime,
        file,
        avatarUrl,
      ];

  const MyAccountState({
    required this.route,
    required this.profileModel,
    required this.dateTime,
    required this.file,
    required this.avatarUrl,
  });

  MyAccountState copyWith({
    CustomRoute? route,
    ProfileModel? profileModel,
    String? dateTime,
    XFile? file,
    String? avatarUrl,
  }) {
    return MyAccountState(
      route: route ?? this.route,
      profileModel: profileModel ?? this.profileModel,
      dateTime: dateTime ?? this.dateTime,
      file: file ?? this.file,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
