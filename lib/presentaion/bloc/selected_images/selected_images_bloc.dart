import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:photo_manager/photo_manager.dart';

part 'selected_images_event.dart';
part 'selected_images_state.dart';

class SelectedImagesBloc
    extends Bloc<SelectedImagesEvent, SelectedImagesState> {
  SelectedImagesBloc() : super(SelectedImagesInitial()) {
    on<SelectedImagesForPostEvent>(addPost);
  }
  FutureOr<void> addPost(
      SelectedImagesForPostEvent event, Emitter<SelectedImagesState> emit) {
    {
      emit(SelectedImagesSuccessState(selectedimages: event.selectedimages));
    }
  }
}
