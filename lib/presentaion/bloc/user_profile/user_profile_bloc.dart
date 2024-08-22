// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/domain/usecase/user_usecases/user_usecase.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserUsecase userUsecase;
  UserProfileBloc({required this.userUsecase}) : super(UserProfileInitial()) {
    on<UserProfileInitialDetailsFetchEvent>(profileInitialDetailsFetchEvent);
  }
  FutureOr<void> profileInitialDetailsFetchEvent(
      UserProfileInitialDetailsFetchEvent event,
      Emitter<UserProfileState> emit) async {
    emit(UserProfileFetchLoadingState());
    final Response result = await userUsecase.fetchLoggedInuseerDetails();
    final responseBody = jsonDecode(result.body);
    if (result.statusCode == 200) {
      debugPrint('${responseBody['user']['username']}');
      final UserModel user = UserModel.fromJson(responseBody['user']);
      // final PostModel post = PostModel.fromJson(responseBody['posts']);
      //  log('posts description${responseBody['posts']['description']}');
      final List<PostModel> posts = List<PostModel>.from(
          responseBody['posts'].map((post) => PostModel.fromJson(post)));
      user.posts = posts;
      debugPrint('inside this${user.username}');
      emit(UserProfileSuccessfulState(
        user: user,
        // post: post
      ));
    } else {
      emit(UserProfileFetchServereErrorState());
    }
  }
}
