// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:zora/data/models/post_model/post_model.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial());
}
