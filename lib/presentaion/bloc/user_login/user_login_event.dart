part of 'user_login_bloc.dart';

@immutable
sealed class UserLoginEvent {}

class UserloginEvent extends UserLoginEvent {
  final String username;
  final String password;
  UserloginEvent({required this.username, required this.password});
}
