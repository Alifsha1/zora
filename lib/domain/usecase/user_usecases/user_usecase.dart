import 'package:zora/domain/repo/user_repo/user.dart';

class UserUsecase {
  final UserRepo userRepo;
  UserUsecase({required this.userRepo});
  fetchLoggedInuseerDetails() async {
    return await userRepo.fetchLoggedInuseerDetails();
  }

  getuserdetails(String userid) async {
    return await userRepo.getuserdetails(userid);
  }

  followuser(String userid) async {
    return await userRepo.followuser(userid);
  }

  unfollowuser(String userid) async {
    return await userRepo.unfollowuser(userid);
  }
}
