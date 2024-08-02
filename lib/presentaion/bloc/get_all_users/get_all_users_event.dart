part of 'get_all_users_bloc.dart';

@immutable
sealed class GetAllUsersEvent {}

class GetAllUsersInitialFetchEvent extends GetAllUsersEvent {}

class GetSearchUserInitialFetchEvent extends GetAllUsersEvent {
  final String value;
  GetSearchUserInitialFetchEvent({required this.value});
}
