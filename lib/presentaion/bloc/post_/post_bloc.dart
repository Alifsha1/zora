import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:zora/data/models/post_model/post_model.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    // on<PostEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }
}
