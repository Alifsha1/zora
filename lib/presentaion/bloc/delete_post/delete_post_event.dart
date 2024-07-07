part of 'delete_post_bloc.dart';

@immutable
sealed class DeletePostEvent {}

class DeletePostfromProfileEvent extends DeletePostEvent {
  final String postid;
  DeletePostfromProfileEvent({required this.postid});
}
