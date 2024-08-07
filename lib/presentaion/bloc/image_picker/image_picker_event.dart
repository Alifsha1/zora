part of 'image_picker_bloc.dart';

@immutable
sealed class ImagePickerEvent {}

final class AddProfilePicEvent extends ImagePickerEvent {
  final File image;
  AddProfilePicEvent({required this.image});
}

final class AddCoverPicEvent extends ImagePickerEvent {
  final File image;
  AddCoverPicEvent({required this.image});
}

final class UploadProfilePicCloudinary extends ImagePickerEvent {
  final dynamic image;
  UploadProfilePicCloudinary({required this.image});
}

final class ResetImagePickerEvent extends ImagePickerEvent {}
