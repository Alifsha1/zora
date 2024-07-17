part of 'save_un_save_post_bloc.dart';

@immutable
sealed class SaveUnSavePostState {}

final class SaveUnSavePostInitial extends SaveUnSavePostState {}

class SavePostSuccessState extends SaveUnSavePostState {}
class UnsavePostSuccessState extends SaveUnSavePostState{}