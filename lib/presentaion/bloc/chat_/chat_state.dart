part of 'chat_bloc.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatUpdateState extends ChatState {}

final class ChatLoadingState extends ChatState {}

final class GetChatSuccessfullState extends ChatState {
  final List<ChatModel> chat;
  GetChatSuccessfullState({required this.chat});
}

final class ChatWithCurrentUserState extends ChatState {
  final List<UserModel> users;
  ChatWithCurrentUserState({required this.users});
}
