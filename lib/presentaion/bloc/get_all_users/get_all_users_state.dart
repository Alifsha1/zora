part of 'get_all_users_bloc.dart';

@immutable
sealed class GetAllUsersState {}

final class GetAllUsersInitial extends GetAllUsersState {}

final class GetAllUserLoadingState extends GetAllUsersState {}

final class GetAllUserSuccessState extends GetAllUsersState {
  final List<UserModel> users;
  GetAllUserSuccessState({required this.users});
}

 final class GetAllUserErrorState extends GetAllUsersState {}

// final class GetSearchUserLoadingState extends GetAllUsersState {}

// final class GetSearchUserSuccessState extends GetAllUsersState {
//   final List<UserModel> users;
//   GetSearchUserSuccessState({required this.users});
// }
// final class GetSearchUserErrorState extends GetAllUsersState {}
