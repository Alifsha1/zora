// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:zora/data/repository/forget_repo_impl/forget_repo.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on<ForgetSentOtpEvent>(forgetsendOtp);
    on<ForgetResetPasswordEvent>(forgetResetPassword);
  }

  FutureOr<void> forgetsendOtp(
      ForgetSentOtpEvent event, Emitter<ForgetPasswordState> emit) async {
    emit(ForgetSentOtpLoadingState());
    String response = await ForgetRepo.forgetSendOtp(email: event.email);
    if (response == 'success') {
      emit(ForgetSentOtpSuccessState());
    } else if (response == 'user-not-found') {
      emit(ForgetUserNotExistsState());
    } else {
      emit(ForgetSentOtpErrorState());
    }
  }

  FutureOr<void> forgetResetPassword(
      ForgetResetPasswordEvent event, Emitter<ForgetPasswordState> emit) async {
    emit(ForgetResetPasswordLoadingState());
    String response = await ForgetRepo.resetPassword(
        email: event.email, otp: event.otp, password: event.password);
    if (response == 'success') {
      emit(ForgetResetPasswordSuccessState());
    } else if (response == 'invalid-otp') {
      emit(ForgetResetPasswordInvalidOtpState());
    } else {
      emit(ForgetResetPasswordErrorState());
    }
  }
}
