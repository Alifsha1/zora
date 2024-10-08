// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/data/repository/auth_repo_impl/auth_repo.dart';
import 'package:zora/domain/usecase/auth_usecase/auth_usecase.dart';

part 'sign_up_bloc_event.dart';
part 'sign_up_bloc_state.dart';

class SignUpBlocBloc extends Bloc<SignUpBlocEvent, SignUpBlocState> {
  final AuthUsecase authUsecase;

  SignUpBlocBloc({required this.authUsecase}) : super(SignUpBlocInitial()) {
    on<UserOtpVerificationEvent>(userOtpVerificationEvent);
    on<UserSignedEvent>(userSignUpEvent);
  }

  Future<void> userSignUpEvent(
      UserSignedEvent event, Emitter<SignUpBlocState> emit) async {
    emit(UserSignUpLoadingState());
    SignUpResult response = await authUsecase.userSignUp(user: event.user);
    if (response.status == 'success') {
      emit(UserSignUpSuccessState());
    } else if (response.status == 'invalid-otp') {
      emit(USerOtpErrorState());
    } else if (response.status == 'username-exists') {
      emit(UsernameExistsErrorState());
    } else if (response.status == 'phoneno-exists') {
      emit(PhonenoExistsErrorState());
    } else {
      emit(UserSignUpErrorState());
    }
  }

  FutureOr<void> userOtpVerificationEvent(
      UserOtpVerificationEvent event, Emitter<SignUpBlocState> emit) async {
    emit(UserOtpLoadingState());
    String response = await authUsecase.userVerifyOtp(email: event.email);
    if (response == 'success') {
      emit(USerOtpSucceccState());
    } else if (response == 'already-exists') {
      emit(UsernameExistsErrorState());
    } else {
      emit(USerOtpErrorState());
    }
  }
}
