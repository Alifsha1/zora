part of 'all_chat_with_me_bloc.dart';

@immutable
sealed class AllChatWithMeState {}

final class AllChatWithMeInitial extends AllChatWithMeState {}

final class GetAllChatWithMeSucceccfullState extends AllChatWithMeState {
  final List chat;
  GetAllChatWithMeSucceccfullState({required this.chat});
}
