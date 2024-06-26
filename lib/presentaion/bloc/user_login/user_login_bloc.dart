import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/domain/repository/auth_repo/auth_repo.dart';

part 'user_login_event.dart';
part 'user_login_state.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  UserLoginBloc() : super(UserLoginInitial()) {
    on<UserloginEvent>(userLoginEvent);
  }
  Future<void> userLoginEvent(
      UserloginEvent event, Emitter<UserLoginState> emit) async {
    emit(UserLoginLoadingState());
    SignInResult responce = await Authrepo.userLogin(
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
