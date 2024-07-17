import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zora/domain/repository/post_repo/post_repo.dart';

part 'save_un_save_post_event.dart';
part 'save_un_save_post_state.dart';

class SaveUnSavePostBloc
    extends Bloc<SaveUnSavePostEvent, SaveUnSavePostState> {
  SaveUnSavePostBloc() : super(SaveUnSavePostInitial()) {
    on<SavePostEvent>(savepost);
    on<UnsavePostEvent>(unsavepost);
  }
  FutureOr<void> savepost(
      SavePostEvent event, Emitter<SaveUnSavePostState> emit) async {
    var response = await PostRepo.savepost(event.postid);
    if (response == 'success') {
      log('Save Success');
      emit(SavePostSuccessState());
    }
  }

  FutureOr<void> unsavepost(
      UnsavePostEvent event, Emitter<SaveUnSavePostState> emit) async {
    var response = await PostRepo.unsavepost(event.postid);
    if (response == 'success') {
      log('UnSave Success');
      emit(UnsavePostSuccessState());
    }
  }
}
