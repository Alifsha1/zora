part of 'profile_fetch_by_id_bloc.dart';

@immutable
sealed class ProfileFetchByIdEvent {}

class ProfileFetchingByIdEvent extends ProfileFetchByIdEvent {
  final String userid;
  ProfileFetchingByIdEvent({required this.userid});
}
