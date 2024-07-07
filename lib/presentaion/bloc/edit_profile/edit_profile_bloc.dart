// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zora/domain/repository/profile_repo/profile_repo.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileInitial()) {
    on<EditUserDetailEvent>(editUserDetailsEvent);
  }
  FutureOr<void> editUserDetailsEvent(
      EditUserDetailEvent event, Emitter<EditProfileState> emit) async {
        
    emit(EditUSerDetailsLoadingState());
    final result = await ProfileRepo.updateUserDetails(event.username!,
        event.fullname!, event.bio, event.profilePicture, event.coverPicture);
    if (result) {
      emit(EditUserDetailsSuccessState());
    } else {
      emit(EditUserDetailsErrorState());
    }
  }
}
