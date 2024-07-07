part of 'edit_profile_bloc.dart';

@immutable
sealed class EditProfileEvent {}

class EditUserDetailEvent extends EditProfileEvent {
   final String? username;
  final String? fullname;
  final dynamic profilePicture;
  final dynamic  coverPicture;
  final String? bio;
  EditUserDetailEvent( {
     this.username,
     this.fullname,
     this.profilePicture,
     this.coverPicture,
     this.bio
  });
}
