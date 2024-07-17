import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/domain/repository/post_repo/post_repo.dart';

part 'saved_posts_event.dart';
part 'saved_posts_state.dart';

class SavedPostsBloc extends Bloc<SavedPostsEvent, SavedPostsState> {
  SavedPostsBloc() : super(SavedPostsInitial()) {
    on<GetSavedPostEvent>(savedposts);
  }
  FutureOr<void> savedposts(
      GetSavedPostEvent event, Emitter<SavedPostsState> emit) async {
    log('woeking bloc saved');
    emit(GetSavedPostLoadingState());
    List<PostModel?> savedposts = await PostRepo.savedposts();
    if (savedposts.isNotEmpty) {
      log("saved post length${savedposts.length.toString()}");
      emit(GetSavedPostSuccessState(savedposts: savedposts));
    } else {
      emit(GetSavedPostErrorState());
    }
  }
}
