import 'dart:async';
import 'dart:developer';

import '''
package:bloc/bloc.dart''';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/domain/repository/post_repo/post_repo.dart';

part 'get_all_post_event.dart';
part 'get_all_post_state.dart';

class GetAllPostBloc extends Bloc<GetAllPostEvent, GetAllPostState> {
  GetAllPostBloc() : super(GetAllPostInitial()) {
    on<GetAllPostInitialFetchEvent>(fetchAllposts);
  }
  FutureOr<void> fetchAllposts(
      GetAllPostInitialFetchEvent event, Emitter<GetAllPostState> emit) async {
    emit(GetAllPostLoadingState());
    List<PostModel> posts = await PostRepo.fetchpost();
    // log(posts.toString());
    if (posts.isNotEmpty) {
      log(posts.length.toString());
      emit(GetAllPostSuccessState(posts: posts));
    } else {
      emit(GetAllPostErrorState());
    }
  }
}
