import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/domain/repo/auth_repo/auth.dart';

class AuthUsecase {
  final AuthRepo authRepo;
  AuthUsecase({required this.authRepo});
  userSignUp({required UserModel user}) async {
    return await authRepo.userSignUp(user: user);
  }

  userVerifyOtp({required String email}) async {
    return await authRepo.userVerifyOtp(email: email);
  }

  userLogin({required String username, required String password}) async {
    return await authRepo.userLogin(username: username, password: password);
  }
}
