part of 'saved_posts_bloc.dart';

@immutable
sealed class SavedPostsState {}

final class SavedPostsInitial extends SavedPostsState {}

final class GetSavedPostLoadingState extends SavedPostsState {}

final class GetSavedPostSuccessState extends SavedPostsState {
  final List<PostModel?> savedposts;
  final List<String?> savedpostids;
  GetSavedPostSuccessState( {required this.savedposts,required this.savedpostids,});
}

final class GetSavedPostErrorState extends SavedPostsState {}
