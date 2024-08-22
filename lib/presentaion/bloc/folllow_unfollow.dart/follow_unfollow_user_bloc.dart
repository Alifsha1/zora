// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/domain/usecase/user_usecases/user_usecase.dart';

part 'follow_unfollow_user_event.dart';
part 'follow_unfollow_user_state.dart';

class FollowUnfollowUserBloc
    extends Bloc<FollowUnfollowUserEvent, FollowUnfollowUserState> {
      final UserUsecase userUsecase;
  List<Map<String, dynamic>> followers = [];
  FollowUnfollowUserBloc({required this.userUsecase}) : super(FollowUnfollowUserInitial()) {
    on<FollowUserEvent>(followuser);
    on<UnFollowUserEvent>(unfollowuser);
  }
  FutureOr<void> followuser(
      FollowUserEvent event, Emitter<FollowUnfollowUserState> emit) async {
    final result = await userUsecase.followuser(event.userid);
    if (result == true) {
      followers.add(event.user.toJson());
      emit(FollowUserSuccessState());
    } else {
      emit(FolloUserErrorState());
    }
  }

  FutureOr<void> unfollowuser(
      UnFollowUserEvent event, Emitter<FollowUnfollowUserState> emit) async {
    final result = await userUsecase.unfollowuser(event.userid);
    if (result == true) {
      followers.remove(event.userid);
      emit(UnFollowUserSuccessState());
    } else {
      emit(UnFolloUserErrorState());
    }
  }
}
