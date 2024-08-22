// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/domain/usecase/all_users_usecase/all_users_usecase.dart';

part 'get_all_users_event.dart';
part 'get_all_users_state.dart';

class GetAllUsersBloc extends Bloc<GetAllUsersEvent, GetAllUsersState> {
  final AllUsersUsecase allUsersUsecase;
  GetAllUsersBloc({required this.allUsersUsecase})
      : super(GetAllUsersInitial()) {
    on<GetAllUsersInitialFetchEvent>(fetchallusers);
    on<GetSearchUserInitialFetchEvent>(searchusers);
  }
  FutureOr<void> fetchallusers(GetAllUsersInitialFetchEvent event,
      Emitter<GetAllUsersState> emit) async {
    emit(GetAllUserLoadingState());
    List<UserModel> users = await allUsersUsecase.getallusers();
    if (users.isNotEmpty) {
      log(users.length.toString());
      emit(GetAllUserSuccessState(users: users));
    } else {
      emit(GetAllUserErrorState());
    }
  }

  FutureOr<void> searchusers(GetSearchUserInitialFetchEvent event,
      Emitter<GetAllUsersState> emit) async {
    emit(GetAllUserLoadingState());
    List<UserModel> users = await allUsersUsecase.search(event.value);
    log('Users length on search: ${users.length}');
    if (users.isNotEmpty) {
      log(users.length.toString());
      emit(GetAllUserSuccessState(users: users));
    } else {
      emit(GetAllUserErrorState());
    }
  }
}
