import 'package:zora/domain/repo/all_users_repo/all_users.dart';

class AllUsersUsecase {
  final AllUsersRepo allUsersRepo;
  AllUsersUsecase({required this.allUsersRepo});
  getallusers() async {
    return await allUsersRepo.getAllUsers();
  }

  search(String username) async {
    return await allUsersRepo.search(username);
  }
}
