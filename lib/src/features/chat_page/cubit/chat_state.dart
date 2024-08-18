part of 'chat_cubit.dart';

final class ChatState extends Equatable {
  final CustomRoute route;
  final List<MessageModel?>? messages;
  final bool isButtonActive;
  @override
  List<Object?> get props => [
        route,
        messages,
        isButtonActive,
      ];

  const ChatState({
    required this.route,
    required this.messages,
    required this.isButtonActive,
  });

  ChatState copyWith({
    CustomRoute? route,
    List<MessageModel?>? messages,
    bool? isButtonActive,
  }) {
    return ChatState(
      route: route ?? this.route,
      messages: messages ?? this.messages,
      isButtonActive: isButtonActive ?? this.isButtonActive,
    );
  }
}
