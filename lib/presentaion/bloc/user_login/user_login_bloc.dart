// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/data/repository/auth_repo_impl/auth_repo.dart';
import 'package:zora/domain/usecase/auth_usecase/auth_usecase.dart';

part 'user_login_event.dart';
part 'user_login_state.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  final AuthUsecase authUsecase;

  UserLoginBloc({required this.authUsecase}) : super(UserLoginInitial()) {
    on<UserloginEvent>(userLoginEvent);
  }
  Future<void> userLoginEvent(
      UserloginEvent event, Emitter<UserLoginState> emit) async {
    emit(UserLoginLoadingState());
    SignInResult responce = await authUsecase.userLogin(
        username: event.username, password: event.password);
    if (responce.status == 'success') {
      final userModel = UserModel.fromJson(responce.responseBody);
      emit(UserLoginSuccessState(userModel: userModel));
    } else if (responce.status == 'invalid-username') {
      emit(InvalidUsernameErrorState());
    } else if (responce.status == 'invalid-password') {
      emit(InvalidPasswordErrorState());
    } else if (responce.status == 'blocked-by-admin') {
      emit(BlockedbyAdminErrorState());
    } else {
      emit(UserSignInErrorState());
    }
  }
}
