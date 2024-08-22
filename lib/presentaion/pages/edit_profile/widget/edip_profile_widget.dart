import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/icons/customiconsflutter_icons.dart';
import 'package:zora/core/utils/alerts.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/bloc/edit_profile/edit_profile_bloc.dart';
import 'package:zora/presentaion/bloc/image_picker/image_picker_bloc.dart';
import 'package:zora/presentaion/pages/edit_profile/widget/edit_profile_text_field.dart';
import 'package:zora/presentaion/pages/nav_bar/nav_bar.dart';

// ignore: must_be_immutable
class EditProfileWidget extends StatefulWidget {
   EditProfileWidget({
    super.key,
    required this.mediaheight,
    required this.mediawidth,
    required this.fullnameController,
    required this.usernameController,
    required this.bioController,
    required this.user,
    required this.onTapprofilepic,
    required this.profileimage,
    required this.coverimage,
    required this.profileImageUrl,
    required this.coverpicImageUrl,
    required this.onTappcoverpic,
  });
  final UserModel user;
  final double mediaheight;
  final double mediawidth;
  final TextEditingController fullnameController;
  final TextEditingController usernameController;
  final TextEditingController bioController;

  File? profileimage;
  File? coverimage;
  String profileImageUrl;
  String coverpicImageUrl;
  final void Function() onTapprofilepic;
  final void Function() onTappcoverpic;


  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<EditProfileBloc, EditProfileState>(
        listener: (context, state) {
          if (state is EditUserDetailsSuccessState) {
            customSnackbar(context, 'Profile Edited', Colors.green);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const CustomNavBar()),
                (route) => false);
          }
        },
        builder: (context, state) {
          return BlocConsumer<ImagePickerBloc, ImagePickerState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is ProfilePicImageSuccessState) {
                  widget.profileimage = state.image;
                  widget.profileImageUrl = '';
                }
                if (state is CoverPicImageSuccessState) {
                  widget.coverimage = state.image;
                  widget.coverpicImageUrl = '';
                }
                return Column(
                  children: [
                    SizedBox(
                      height: 280,
                      child: Stack(
                        children: [
                          const Positioned(
                            top: 10,
                            right: 20,
                            child: Icon(
                              Customiconsflutter.settingline,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            top: 00,
                            right: 0,
                            left: 0,
                            child: Container(
                              height: widget.mediaheight * .26,
                              width: widget.mediawidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                image: DecorationImage(
                                  image: widget.coverpicImageUrl == ""
                                      ? widget.coverimage == null
                                          ? const AssetImage(
                                              'assets/images/placeholdercover.jpg')
                                          : Image.file(widget.coverimage!).image
                                      : NetworkImage(widget.coverpicImageUrl)
                                          as ImageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: widget.mediaheight * .01,
                            right: widget.mediawidth * .3,
                            child: CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 63,
                                backgroundImage: widget.profileImageUrl == ''
                                    ? widget.profileimage == null
                                        ? const AssetImage(
                                            'assets/images/placeholderimage.jpg')
                                        : Image.file(widget.profileimage!).image
                                    : NetworkImage(widget.profileImageUrl)
                                        as ImageProvider,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: widget.mediaheight * .03,
                            right: widget.mediawidth * .3,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: GestureDetector(
                                onTap: widget.onTapprofilepic,
                                child: const Icon(
                                  Customiconsflutter.editfill,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: widget.mediaheight * .11,
                            right: widget.mediawidth * .04,
                            child: CircleAvatar(
                              radius: 13,
                              backgroundColor: Colors.white,
                              child: GestureDetector(
                                onTap: widget.onTappcoverpic,
                                child: const Icon(
                                  Customiconsflutter.editfill,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFieldEditProfile(
                      bioController: widget.bioController,
                      fullnameController: widget.fullnameController,
                      usernameController: widget.usernameController,
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}
