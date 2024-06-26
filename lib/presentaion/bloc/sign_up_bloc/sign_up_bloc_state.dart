part of 'sign_up_bloc_bloc.dart';

@immutable
sealed class SignUpBlocState {}

final class SignUpBlocInitial extends SignUpBlocState {}
class UserSignUpLoadingState extends SignUpBlocState{}
class UserSignUpSuccessState extends SignUpBlocState{}
class UserSignUpErrorState extends SignUpBlocState{}
class UserOtpLoadingState extends SignUpBlocState{}
class USerOtpSucceccState extends SignUpBlocState{}
class USerOtpErrorState extends SignUpBlocState{}
class UsernameExistsErrorState extends SignUpBlocState{}
class EmailExistsErrorState extends SignUpBlocState{}
class PhonenoExistsErrorState extends SignUpBlocState{}