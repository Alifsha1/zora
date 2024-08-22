// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/data/repository/post_repo_impl/post_repo.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentInitial()) {
    on<AddCommentEvent>(addcomment);
    on<DeleteCommentEvent>(deletecomment);
  }
  FutureOr<void> addcomment(
      AddCommentEvent event, Emitter<CommentState> emit) async {
    emit(AddCommentLoadingState());
    CommentModel? commentModel =
        await PostRepo.addcomment(event.comment, event.postid);
    if (commentModel != null) {
      event.postModel.comments!.add(
        CommentModel(
          user: event.userModel,
          comments: event.comment,
          createdAt: DateTime.now().toString(),
        ),
      );
      emit(AddCommentSuccessState(commentModel: commentModel));
    }
  }

  FutureOr<void> deletecomment(
      DeleteCommentEvent event, Emitter<CommentState> emit) async {
    String response = await PostRepo.deletecomment(event.commentid, event.postid);
    if (response == 'success') {
      event.postModel.comments!
          .removeWhere((element) => element.id == event.commentid);
      emit(DeleteCommentSuccessState(commentid: event.commentid));
    }
  }
}
