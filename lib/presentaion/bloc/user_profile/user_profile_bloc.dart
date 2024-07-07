import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/domain/repository/user_repo/user_repo.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(UserProfileInitial()) {
    on<UserProfileInitialDetailsFetchEvent>(profileInitialDetailsFetchEvent);
  }
  FutureOr<void> profileInitialDetailsFetchEvent(
      UserProfileInitialDetailsFetchEvent event,
      Emitter<UserProfileState> emit) async {
    emit(UserProfileFetchLoadingState());
    final Response result = await UserRepo.fetchLoggedInuseerDetails();
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
