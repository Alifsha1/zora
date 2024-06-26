import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/domain/repository/profile_repo/profile_repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileInitialFetchEvent>(userDetailInitialFetchEvent);
  }
  Future<void> userDetailInitialFetchEvent(
      ProfileInitialFetchEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileFetchingLoadingState());
    ProfileDetailsModel? userDetails = await ProfileRepo.fetchUserDetails();
    if (userDetails != null) {
      emit(ProfileFetchingSuccessState(
        userDetails: userDetails.user,
      ));
    } else {
      emit(ProfileFetchingErrorState());
    }
  }
}
