part of 'create_post_bloc.dart';

@immutable
sealed class CreatePostState {}

final class CreatePostInitial extends CreatePostState {}
class AddPostLoadingState extends CreatePostState{}
class AddPostSuccessState extends CreatePostState{}
class AddPostErrorState extends CreatePostState{}