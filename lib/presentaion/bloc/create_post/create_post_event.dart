part of 'create_post_bloc.dart';

@immutable
sealed class CreatePostEvent {}

class AddingPostEvent extends CreatePostEvent {
  final String? description;
  final String? location;
  final List<AssetEntity> selectedimages;
  AddingPostEvent({required this.description, required this.location,required this.selectedimages});
}
