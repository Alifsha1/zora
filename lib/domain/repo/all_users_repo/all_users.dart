import 'package:zora/data/models/user_model/user_model.dart';

abstract class AllUsersRepo {
  Future<List<UserModel>> getAllUsers();
  Future<List<UserModel>> search(String username);
  
}
