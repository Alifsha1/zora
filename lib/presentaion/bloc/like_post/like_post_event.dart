part of 'like_post_bloc.dart';

@immutable
sealed class LikePostEvent {}

final class LikePostFetchEvent extends LikePostEvent {
  final String postid;
  LikePostFetchEvent({required this.postid});
}
final class UnLikePostFetchEvent extends LikePostEvent {
  final String postid;
  UnLikePostFetchEvent({required this.postid});
}