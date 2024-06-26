part of 'sign_up_bloc_bloc.dart';

@immutable
sealed class SignUpBlocEvent {}

class UserSignedEvent extends SignUpBlocEvent {
  final UserModel user;
  UserSignedEvent({
    required this.user,
  });
}

class UserOtpVerificationEvent extends SignUpBlocEvent {
  final String email;
  UserOtpVerificationEvent({
    required this.email,
  });
}
