part of 'get_all_post_bloc.dart';

@immutable
sealed class GetAllPostState {}

final class GetAllPostInitial extends GetAllPostState {}

final class GetAllPostLoadingState extends GetAllPostState {}

final class GetAllPostSuccessState extends GetAllPostState {

  final List<PostModel> posts;
  GetAllPostSuccessState( {required this.posts});
}

final class GetAllPostErrorState extends GetAllPostState {}
