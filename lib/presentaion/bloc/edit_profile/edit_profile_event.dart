part of 'edit_profile_bloc.dart';

@immutable
sealed class EditProfileEvent {}

class EditUserDetailEvent extends EditProfileEvent {
  final UserModel updateUser;
  final UserModel intialUser;
  final List<AssetEntity> profilePicture;
  EditUserDetailEvent({
    required this.updateUser,
    required this.intialUser,
    required this.profilePicture,
  });
}
