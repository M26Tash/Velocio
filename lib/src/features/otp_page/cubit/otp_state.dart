part of 'otp_cubit.dart';

final class OtpState extends Equatable {
  final CustomRoute route;
  @override
  List<Object?> get props => [
        route,
      ];

  const OtpState({
    required this.route,
  });

  OtpState copyWith({
    CustomRoute? route,
  }) {
    return OtpState(
      route: route ?? this.route,
    );
  }
}
