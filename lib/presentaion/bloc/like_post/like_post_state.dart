part of 'like_post_bloc.dart';

@immutable
sealed class LikePostState {}

final class LikePostInitial extends LikePostState {}



class LikePostSuccessState extends LikePostState {}
class UnLikePostSuccessState extends LikePostState{}
