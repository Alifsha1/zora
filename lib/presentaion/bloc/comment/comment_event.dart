part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

class AddCommentEvent extends CommentEvent {
  final String postid;
  final String comment;
  final PostModel postModel;
  final UserModel userModel;
  AddCommentEvent({
    required this.postid,
    required this.comment,
    required this.postModel,
    required this.userModel,
  });
}

class DeleteCommentEvent extends CommentEvent {
  final String postid;
  final String commentid;
  final  PostModel postModel;
  DeleteCommentEvent({
    required this.postid,
    required this.commentid,
    required this.postModel,
  });
}
