part of 'selected_images_bloc.dart';

@immutable
sealed class SelectedImagesState {}

final class SelectedImagesInitial extends SelectedImagesState {}

final class SelectedImagesSuccessState extends SelectedImagesState {
  final List<AssetEntity> selectedimages;
  SelectedImagesSuccessState({required this.selectedimages});
}
