part of 'chat_cubit.dart';

final class ChatState extends Equatable {
  final CustomRoute route;
  final List<Map<String, dynamic>?>? messages;
  @override
  List<Object?> get props => [
        route,
        messages,
      ];

  const ChatState({
    required this.route,
    required this.messages,
  });

  ChatState copyWith({
    CustomRoute? route,
    List<Map<String, dynamic>?>? messages,
  }) {
    return ChatState(
      route: route ?? this.route,
      messages : messages ?? this.messages,
    );
  }
}
