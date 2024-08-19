

import 'package:http/http.dart' as http;
import 'package:zora/data/datasourse/remote/all_datasource/all_users_datasource.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/domain/repo/all_users_repo/all_users.dart';

class AllUsersRepoImpl implements AllUsersRepo {
  final AllUsersDatasource allUsersDatasource;

  AllUsersRepoImpl({required this.allUsersDatasource});
  static var client = http.Client();

  @override
  Future<List<UserModel>> getAllUsers() async {
    return await allUsersDatasource.getAllUsers();
  }

  @override
  Future<List<UserModel>> search(String username) async {
    return await allUsersDatasource.search(username);
   
  }
}

// class GetAllUserModel {
//   final List<UserModel> user;

//   GetAllUserModel({
//     required this.user,
//   });
// }
