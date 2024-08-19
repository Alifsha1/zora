import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/data/repository/auth_repo_impl/auth_repo.dart';

abstract class AuthRepo {
  Future<SignUpResult> userSignUp({required UserModel user});
  Future<String> userVerifyOtp({required String email});
  Future<SignInResult> userLogin(
      {required String username, required String password});
}
