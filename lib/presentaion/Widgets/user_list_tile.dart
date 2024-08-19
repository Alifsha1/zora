import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/bloc/profile_fetch_by_id.dart/profile_fetch_by_id_bloc.dart';
import 'package:zora/presentaion/pages/user_profile/loading/followbutton_shimmer.dart';
import 'package:zora/presentaion/pages/user_profile/widget/follow_button.dart';

class UserListTile extends StatefulWidget {
  const UserListTile({
    super.key,
    required this.onTap,
    required this.profileUrl,
    required this.fullname,
    required this.username,
    this.buttonText,
    this.userModel,
    this.id,  this.userid,
    // required this.currentuserModel,
    // required this.currentuserid
  });

  final void Function()? onTap;
   final String? userid;
  final String profileUrl;
  final String fullname;
  final String username;
  final String? buttonText;
  final String? id;
  // final String currentuserid;
  final UserModel? userModel;

  @override
  State<UserListTile> createState() => _UserListTileState();
}

class _UserListTileState extends State<UserListTile> {
  @override
  void initState() {
    context
        .read<ProfileFetchByIdBloc>()
        .add(ProfileFetchingByIdEvent(userid: widget.id!));
    super.initState();
  }

  // final UserModel currentuserModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: widget.profileUrl == ""
              ? Image.asset('assets/images/placeholderimage.jpg').image
              : NetworkImage(widget.profileUrl),
        ),
        title: Text(
          widget.fullname,
          style: const TextStyle(
            fontSize: 15,
            height: 1.5,
          ),
          maxLines: 1,
        ),
        minVerticalPadding: 18,
        subtitle: Text(
          '@${widget.username}',
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        trailing: SizedBox(
          width: 94,
          height: 30,
          child: BlocBuilder<ProfileFetchByIdBloc, ProfileFetchByIdState>(
            builder: (context, state) {
              if (state is ProfileFetchByIdSuccessState) {
                return FollowButton(
                  userModel: state.user,
                  userid: widget.id,
                  currentuserid: widget.userModel!.id!,
                  currentusermodel: widget.userModel!,
                  message: false,
                  //mediawidth: ,
                );
              }
              return const FollowbuttonShimmer();
            },
          ),
        ),
      ),
    );
  }
}
