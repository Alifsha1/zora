part of 'comment_bloc.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}

class AddCommentLoadingState extends CommentState {}

class AddCommentSuccessState extends CommentState {
  final CommentModel commentModel;
  AddCommentSuccessState({required this.commentModel});
}

class DeleteCommentSuccessState extends CommentState {
  final String commentid;
  DeleteCommentSuccessState({required this.commentid});
}

class AddCommentErrorState extends CommentState {}
