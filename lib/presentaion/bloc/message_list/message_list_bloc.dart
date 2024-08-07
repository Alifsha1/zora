import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/domain/repository/chat_repo/chat_repo.dart';

part 'message_list_event.dart';
part 'message_list_state.dart';

class MessageListBloc extends Bloc<MessageListEvent, MessageListState> {
  MessageListBloc() : super(MessageListInitial()) {
    on<GetUsersFromChat>(getUserFromChat);
  }
  FutureOr<void> getUserFromChat(
      GetUsersFromChat event, Emitter<MessageListState> emit) async {
    final List <UserModel>result = await ChatRepo.getusersInChat();
    log('result == $result');
    emit(UserListFromChatSuccessfullState(userlist: result));
  }
}
