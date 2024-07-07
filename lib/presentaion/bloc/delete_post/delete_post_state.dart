part of 'delete_post_bloc.dart';

@immutable
sealed class DeletePostState {}

final class DeletePostInitial extends DeletePostState {}
class DeletePostLoadingState extends DeletePostState{}
class DeletePostSuccessState extends DeletePostState{}
class DeletePostErrorState extends DeletePostState{}