part of 'save_un_save_post_bloc.dart';

@immutable
sealed class SaveUnSavePostEvent {}

class SavePostEvent extends SaveUnSavePostEvent {
  final String postid;
  SavePostEvent({required this.postid});
}

class UnsavePostEvent extends SaveUnSavePostEvent {
  final String postid;
  UnsavePostEvent({required this.postid});
}
