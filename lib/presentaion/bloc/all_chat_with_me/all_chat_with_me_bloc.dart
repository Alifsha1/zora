import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zora/domain/repository/chat_repo/chat_repo.dart';

part 'all_chat_with_me_event.dart';
part 'all_chat_with_me_state.dart';

class AllChatWithMeBloc extends Bloc<AllChatWithMeEvent, AllChatWithMeState> {
  AllChatWithMeBloc() : super(AllChatWithMeInitial()) {
    on<GetAllChatWithMeEvent>(getallchatwithme);
  }
  FutureOr<void> getallchatwithme(
      GetAllChatWithMeEvent event, Emitter<AllChatWithMeState> emit) async {
    final List result = await ChatRepo.getAllChatwithMe();
    if (result.isNotEmpty) {
      emit(GetAllChatWithMeSucceccfullState(chat: result));
    } else {
      log('Get alla chat with me failed');
    }
  }
}
