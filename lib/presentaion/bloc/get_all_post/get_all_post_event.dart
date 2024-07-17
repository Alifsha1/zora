part of 'get_all_post_bloc.dart';

@immutable
sealed class GetAllPostEvent {}
class GetAllPostInitialFetchEvent extends GetAllPostEvent{}