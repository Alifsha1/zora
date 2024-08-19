import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:zora/data/repository/post_repo_impl/post_repo.dart';

part 'like_post_event.dart';
part 'like_post_state.dart';

class LikePostBloc extends Bloc<LikePostEvent, LikePostState> {
  LikePostBloc() : super(LikePostInitial()) {
    on<LikePostFetchEvent>(likepost);
    on<UnLikePostFetchEvent>(unlikepost);
  }

  FutureOr<void> likepost(
      LikePostFetchEvent event, Emitter<LikePostState> emit) async {
    var respone = await PostRepo.likepost(postid: event.postid);
    if (respone == 'success') {
      emit(LikePostSuccessState());
    } else {
      debugPrint('Error in like post');
    }
  }

  FutureOr<void> unlikepost(
      UnLikePostFetchEvent event, Emitter<LikePostState> emit) async {
    var response = await PostRepo.unlikepost(postid: event.postid);
    if (response == 'success') {
      log('success');
      emit(UnLikePostSuccessState());
    } else {
      debugPrint('Error in unlike post');
    }
  }
}
