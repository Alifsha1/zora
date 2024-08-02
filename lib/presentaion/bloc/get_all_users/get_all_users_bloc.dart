import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/domain/repository/all_users_repo/all_users_repo.dart';

part 'get_all_users_event.dart';
part 'get_all_users_state.dart';

class GetAllUsersBloc extends Bloc<GetAllUsersEvent, GetAllUsersState> {
  GetAllUsersBloc() : super(GetAllUsersInitial()) {
    on<GetAllUsersInitialFetchEvent>(fetchallusers);
    on<GetSearchUserInitialFetchEvent>(searchusers);
  }
  FutureOr<void> fetchallusers(GetAllUsersInitialFetchEvent event,
      Emitter<GetAllUsersState> emit) async {
    emit(GetAllUserLoadingState());
    List<UserModel> users = await AllUsersRepo.getAllUsers();
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
    List<UserModel> users = await AllUsersRepo.search(event.value);
    log('Users length on search: ${users.length}');
    if (users.isNotEmpty) {
      log(users.length.toString());
      emit(GetAllUserSuccessState(users: users));
    } else {
      emit(GetAllUserErrorState());
    }
  }
}
