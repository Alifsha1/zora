part of 'image_picker_bloc.dart';

@immutable
sealed class ImagePickerState {}

final class ImagePickerInitial extends ImagePickerState {}

final class ProfilePicImageSuccessState extends ImagePickerState {
  final File image;
  ProfilePicImageSuccessState({required this.image});
}

final class CoverPicImageSuccessState extends ImagePickerState {
  final File image;
  CoverPicImageSuccessState({required this.image});
}
