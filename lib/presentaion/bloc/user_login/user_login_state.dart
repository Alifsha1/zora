part of 'user_login_bloc.dart';

@immutable
sealed class UserLoginState {}

final class UserLoginInitial extends UserLoginState {}

class UserLoginLoadingState extends UserLoginState {}

class UserLoginSuccessState extends UserLoginState {
  final UserModel userModel;
  UserLoginSuccessState({required this.userModel});
}
class InvalidUsernameErrorState extends UserLoginState{}
class InvalidPasswordErrorState extends UserLoginState{}
class BlockedbyAdminErrorState extends UserLoginState{}
class UserSignInErrorState extends UserLoginState{}
