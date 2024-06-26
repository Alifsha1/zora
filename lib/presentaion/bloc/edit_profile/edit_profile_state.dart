part of 'edit_profile_bloc.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}
class EditUSerDetailsLoadingState extends EditProfileState{}
class EditUserDetailsSuccessState extends EditProfileState{}
class EditUsernameAlreadyExistsState extends EditProfileState{}
class EditUserDetailsErrorState extends EditProfileState{}
