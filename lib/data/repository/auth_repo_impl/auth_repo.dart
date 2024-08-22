
import 'package:http/http.dart' as http;
import 'package:zora/data/datasourse/remote/auth_datasource/auth_datasource.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/domain/repo/auth_repo/auth.dart';

class AuthrepoImpl implements AuthRepo {
  final AuthDatasource authDatasource;
  AuthrepoImpl({required this.authDatasource});
  static var client = http.Client();
  @override
  Future<SignUpResult> userSignUp({required UserModel user}) async {
    return await authDatasource.userSignUp(user: user);
  }

  @override
  Future<String> userVerifyOtp({required String email}) async {
    return await authDatasource.userVerifyOtp(email: email);
  }
 @override
  Future<SignInResult> userLogin(
      {required String username, required String password}) async {
    return await authDatasource.userLogin(
        username: username, password: password);
   
  }
}

class SignInResult {
  final String? status;
  final dynamic responseBody;
  SignInResult({this.status, this.responseBody});
}

class SignUpResult {
  final String? status;
  final dynamic responseBody;
  SignUpResult({this.status, this.responseBody});
}
