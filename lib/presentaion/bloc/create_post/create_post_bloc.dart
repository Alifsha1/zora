import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:zora/domain/repository/post_repo/post_repo.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostBloc() : super(CreatePostInitial()) {
    on<AddingPostEvent>(createpost);
  }

  FutureOr<void> createpost(
      AddingPostEvent event, Emitter<CreatePostState> emit) async {
    emit(AddPostLoadingState());
    final result = await PostRepo.createpost(
        event.description!, event.selectedimages, event.location!);
    if (result == 'success') {
      emit(AddPostSuccessState());
    } else {
      emit(AddPostErrorState());
    }
  }
}
