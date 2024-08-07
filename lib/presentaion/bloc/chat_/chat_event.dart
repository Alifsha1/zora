part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}

final class ChatUpdateEvent extends ChatEvent {}

final class AddReceiverChatEvent extends ChatEvent {
  final ChatModel chat;
  AddReceiverChatEvent({required this.chat});
}

final class ChatWithUserEvent extends ChatEvent {
  final String userid;
  ChatWithUserEvent({required this.userid});
}
final class GetMyChatEvent extends ChatEvent{}
