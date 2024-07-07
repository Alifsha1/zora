part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

class PostFetchLoadingstate extends PostState {}

class PostFetchingSuccessState extends PostState {
  final List<PostModel> postid;
  PostFetchingSuccessState({
    required this.postid,
  });
}

class PostFetchErrorState extends PostState{}