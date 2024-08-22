// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zora/data/models/chat_model/chat_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/data/repository/chat_repo_impl/chat_repo.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  List<ChatModel> messagelist = [];
  ChatBloc() : super(ChatInitial()) {
    on<AddReceiverChatEvent>(addRecievedChatEvent);
    on<ChatWithUserEvent>(chatWithUserEvent);
    on<GetMyChatEvent>(getmychat);
  }
  FutureOr<void> chatUpdateEvent(
      ChatUpdateEvent event, Emitter<ChatState> emit) {
    emit(ChatUpdateState());
  }

  FutureOr<void> addRecievedChatEvent(
      AddReceiverChatEvent event, Emitter<ChatState> emit) async {
    messagelist.add(event.chat);
    messagelist.sort(((a, b) => a.sendAt.compareTo(b.sendAt)));
    emit(GetChatSuccessfullState(chat: messagelist));
  }

  FutureOr<void> chatWithUserEvent(
      ChatWithUserEvent event, Emitter<ChatState> emit) async {
    emit(ChatLoadingState());
    final List<ChatModel> result = await ChatRepo.getchatwithUser(event.userid);
    log('chat in bloc = $result');
    messagelist = result;
    messagelist.sort(((a, b) => a.sendAt.compareTo(b.sendAt)));
    emit(GetChatSuccessfullState(chat: messagelist));
    if (result.isEmpty) {
      emit(GetChatSuccessfullState(chat: result));
    } 
  }

  FutureOr<void> getmychat(
      GetMyChatEvent event, Emitter<ChatState> emit) async {
    final List<UserModel> result = await ChatRepo.getusersInChat();
    if (result.isNotEmpty) {
      emit(ChatWithCurrentUserState(users: result));
    }
  }
}
