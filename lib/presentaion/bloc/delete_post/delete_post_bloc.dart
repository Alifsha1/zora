// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zora/domain/repository/post_repo/post_repo.dart';

part 'delete_post_event.dart';
part 'delete_post_state.dart';

class DeletePostBloc extends Bloc<DeletePostEvent, DeletePostState> {
  DeletePostBloc() : super(DeletePostInitial()) {
    on<DeletePostfromProfileEvent>(deletepost);
  }
  FutureOr<void> deletepost(
      DeletePostfromProfileEvent event, Emitter<DeletePostState> emit) async {
    String response = await PostRepo.deletepost(postid: event.postid);
    if (response == 'success') {
      emit(DeletePostSuccessState());
    } else {
      emit(DeletePostErrorState());
    }
  }
}
