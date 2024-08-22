// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/domain/usecase/user_usecases/user_usecase.dart';

part 'profile_fetch_by_id_event.dart';
part 'profile_fetch_by_id_state.dart';

class ProfileFetchByIdBloc
    extends Bloc<ProfileFetchByIdEvent, ProfileFetchByIdState> {
      final UserUsecase userUsecase;
  ProfileFetchByIdBloc({required this.userUsecase}) : super(ProfileFetchByIdInitial()) {
    on<ProfileFetchingByIdEvent>(profileftchbyId);
  }
  FutureOr<void> profileftchbyId(ProfileFetchingByIdEvent event,
      Emitter<ProfileFetchByIdState> emit) async {
    emit(ProfileFetchByIdLoadingState());
    final response = await userUsecase.getuserdetails(event.userid);

    if (response != null) {
      UserModel user = response.userModel;
      user.posts = response.postmodel;
      emit(ProfileFetchByIdSuccessState(
        user: user,
        posts: response.postmodel,
      ));
    } else if (response == null) {
      emit(ProfileFetchByIdErrorState());
    }
  }
}
