part of 'saved_posts_bloc.dart';

@immutable
sealed class SavedPostsEvent {}
class GetSavedPostEvent extends SavedPostsEvent{}