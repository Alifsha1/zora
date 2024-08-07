import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/core/navigators/navigators.dart';
import 'package:zora/presentaion/bloc/get_all_users/get_all_users_bloc.dart';
import 'package:zora/presentaion/bloc/profile_fetch_by_id.dart/profile_fetch_by_id_bloc.dart';
import 'package:zora/presentaion/bloc/user_profile/user_profile_bloc.dart';
import 'package:zora/presentaion/pages/explore_page/widget/search_main_card.dart';
import 'package:zora/presentaion/pages/user_profile/user_profile.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({super.key});

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  @override
  Widget build(BuildContext context) {
   // final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;
    return BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
      builder: (context, state) {
        if (state is GetAllUserSuccessState) {
          return SizedBox(
            height: mediaheight * .3,
            child: ListView.builder(
              itemCount: state.users.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return BlocBuilder<UserProfileBloc, UserProfileState>(
                    builder: (context, stateA) {
                  context.watch<UserProfileBloc>().state;
                  if (stateA is UserProfileSuccessfulState) {
                    if (state.users[index].id! == stateA.user.id) {
                      return const SizedBox();
                    }else{
                       return Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              
                              context.read<ProfileFetchByIdBloc>().add(
                                  ProfileFetchingByIdEvent(
                                      userid: state.users[index].id!));
                              navigatorPush(const UserProfileScreen(), context);
                      
                            },
                            child: SearchMainCard(
                              mediaheight: mediaheight,
                              user: state.users[index],
                              currentuserid: stateA.user.id!,
                              currentusermodel: stateA.user,
                            )),
                        kwidht10
                      ],
                    );
                    }
                  }
                  return Container();
                });
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
