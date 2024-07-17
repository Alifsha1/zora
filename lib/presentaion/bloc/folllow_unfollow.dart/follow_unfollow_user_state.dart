part of 'follow_unfollow_user_bloc.dart';

@immutable
sealed class FollowUnfollowUserState {}

final class FollowUnfollowUserInitial extends FollowUnfollowUserState {}

class FollowUserLoadingState extends FollowUnfollowUserState {}

class FollowUserSuccessState extends FollowUnfollowUserState {
  
}

class FolloUserErrorState extends FollowUnfollowUserState {}

class UnFollowUserLoadingState extends FollowUnfollowUserState {}

class UnFollowUserSuccessState extends FollowUnfollowUserState {


}

class UnFolloUserErrorState extends FollowUnfollowUserState {}
