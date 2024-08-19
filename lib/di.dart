import 'package:get_it/get_it.dart';
import 'package:zora/data/datasourse/remote/all_datasource/all_users_datasource.dart';
import 'package:zora/data/datasourse/remote/auth_datasource/auth_datasource.dart';
import 'package:zora/data/datasourse/remote/user_datasource/user_darasource.dart';
import 'package:zora/data/repository/all_users_repo_imp/all_users_repo.dart';
import 'package:zora/data/repository/auth_repo_impl/auth_repo.dart';
import 'package:zora/data/repository/user_repo_impl/user_repo.dart';
import 'package:zora/domain/repo/all_users_repo/all_users.dart';
import 'package:zora/domain/repo/auth_repo/auth.dart';
import 'package:zora/domain/repo/user_repo/user.dart';
import 'package:zora/domain/usecase/all_users_usecase/all_users_usecase.dart';
import 'package:zora/domain/usecase/auth_usecase/auth_usecase.dart';
import 'package:zora/domain/usecase/user_usecases/user_usecase.dart';
import 'package:zora/presentaion/bloc/folllow_unfollow.dart/follow_unfollow_user_bloc.dart';
import 'package:zora/presentaion/bloc/get_all_users/get_all_users_bloc.dart';
import 'package:zora/presentaion/bloc/profile_fetch_by_id.dart/profile_fetch_by_id_bloc.dart';
import 'package:zora/presentaion/bloc/sign_up_bloc/sign_up_bloc_bloc.dart';
import 'package:zora/presentaion/bloc/user_login/user_login_bloc.dart';
import 'package:zora/presentaion/bloc/user_profile/user_profile_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  //bloc register
  getIt.registerFactory<GetAllUsersBloc>(
    () => GetAllUsersBloc(allUsersUsecase: getIt.call()),
  );
  getIt.registerFactory<SignUpBlocBloc>(
    () => SignUpBlocBloc(authUsecase: getIt.call()),
  );
  getIt.registerFactory<UserLoginBloc>(
    () => UserLoginBloc(authUsecase: getIt.call()),
  );
  getIt.registerFactory<UserProfileBloc>(
    () => UserProfileBloc(userUsecase: getIt.call()),
  );
  getIt.registerFactory<ProfileFetchByIdBloc>(
    () => ProfileFetchByIdBloc(userUsecase: getIt.call()),
  );
  getIt.registerFactory<FollowUnfollowUserBloc>(
    () => FollowUnfollowUserBloc(userUsecase: getIt.call()),
  );
//repo register
  getIt.registerLazySingleton<AllUsersRepo>(
    () => AllUsersRepoImpl(allUsersDatasource: AllUsersDatasource()),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthrepoImpl(authDatasource: AuthDatasource()),
  );
  getIt.registerLazySingleton<UserRepo>(
    () => UserRepoImpl(datasource: UserDatasource()),
  );
// usecase register
  getIt.registerLazySingleton<AllUsersUsecase>(
    () => AllUsersUsecase(allUsersRepo: getIt.call()),
  );
  getIt.registerLazySingleton<AuthUsecase>(
    () => AuthUsecase(authRepo: getIt.call()),
  );
  getIt.registerLazySingleton<UserUsecase>(
    () => UserUsecase(userRepo: getIt.call()),
  );
  //data source register
  getIt.registerLazySingleton<AllUsersDatasource>(() => AllUsersDatasource());
  getIt.registerLazySingleton<AuthDatasource>(
    () => AuthDatasource(),
  );
  getIt.registerLazySingleton<UserDatasource>(
    () => UserDatasource(),
  );
}
