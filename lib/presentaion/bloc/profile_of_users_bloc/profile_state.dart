part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileFetchingLoadingState extends ProfileState {}

class ProfileFetchingSuccessState extends ProfileState {
  final UserModel userDetails;
  ProfileFetchingSuccessState({required this.userDetails});
}
class ProfileFetchingErrorState extends ProfileState{}
