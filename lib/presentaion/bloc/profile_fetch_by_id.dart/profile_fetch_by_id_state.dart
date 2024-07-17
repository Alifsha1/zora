part of 'profile_fetch_by_id_bloc.dart';

@immutable
sealed class ProfileFetchByIdState {}

final class ProfileFetchByIdInitial extends ProfileFetchByIdState {}

final class ProfileFetchByIdLoadingState extends ProfileFetchByIdState {}

final class ProfileFetchByIdSuccessState extends ProfileFetchByIdState {
  final UserModel user;
  final List<PostModel> posts;
  ProfileFetchByIdSuccessState({
    required this.user,
    required this.posts,
  });
}

final class ProfileFetchByIdErrorState extends ProfileFetchByIdState {}
