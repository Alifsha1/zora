part of 'user_profile_bloc.dart';

@immutable
sealed class UserProfileState {}

final class UserProfileInitial extends UserProfileState {}

final class UserProfileFetchLoadingState extends UserProfileState {}

final class UserProfileSuccessfulState extends UserProfileState {
  final UserModel user;
  UserProfileSuccessfulState({required this.user});
}
final class UserProfileFetchServereErrorState extends UserProfileState{}
final class UserProfileFetchuserNotfounnd extends UserProfileState{}
