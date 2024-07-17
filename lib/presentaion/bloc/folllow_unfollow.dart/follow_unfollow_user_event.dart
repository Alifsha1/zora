part of 'follow_unfollow_user_bloc.dart';

@immutable
sealed class FollowUnfollowUserEvent {}

class FollowUserEvent extends FollowUnfollowUserEvent {
  final String userid;
  final UserModel user;
  FollowUserEvent({required this.userid,required this.user});
}

class UnFollowUserEvent extends FollowUnfollowUserEvent {
  final String userid;
  UnFollowUserEvent({required this.userid});
}
