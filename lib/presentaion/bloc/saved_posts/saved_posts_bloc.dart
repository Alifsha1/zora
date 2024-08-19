import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/repository/post_repo_impl/post_repo.dart';

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
      List<String?> savedPostIds = savedposts.map((post) => post?.id).toList();
      log('saved posts listss $savedPostIds');
      emit(GetSavedPostSuccessState(
          savedposts: savedposts, savedpostids: savedPostIds));
    } else {
      log('Error state');
      emit(GetSavedPostEmptyState());
    }
  }
}
