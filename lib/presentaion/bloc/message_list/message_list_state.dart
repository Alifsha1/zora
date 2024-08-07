part of 'message_list_bloc.dart';

@immutable
sealed class MessageListState {}

final class MessageListInitial extends MessageListState {}

final class UserListFromChatSuccessfullState extends MessageListState {
  final List<UserModel> userlist;
  UserListFromChatSuccessfullState({required this.userlist});
}
