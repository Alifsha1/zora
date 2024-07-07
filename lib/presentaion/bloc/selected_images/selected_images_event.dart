part of 'selected_images_bloc.dart';

@immutable
sealed class SelectedImagesEvent {}

final class SelectedImagesForPostEvent extends SelectedImagesEvent {
  final List<AssetEntity> selectedimages;
  SelectedImagesForPostEvent({required this.selectedimages});
}
