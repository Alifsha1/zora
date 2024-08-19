import 'package:zora/data/repository/user_repo_impl/user_repo.dart';

abstract class UserRepo {
  Future fetchLoggedInuseerDetails();
  Future<UserModelDetails?> getuserdetails(String userid);
  Future<bool> followuser(String userid);
  Future<bool> unfollowuser(String userid);
}
