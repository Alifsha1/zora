import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/core/icons/customiconsflutter_icons.dart';
import 'package:zora/core/utils/alerts.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/Widgets/elevated_button.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';
import 'package:zora/presentaion/Widgets/text_form_field.dart';
import 'package:zora/presentaion/bloc/edit_profile/edit_profile_bloc.dart';
import 'package:zora/presentaion/bloc/image_picker/image_picker_bloc.dart';
import 'package:zora/presentaion/pages/edit_profile/widget/functions.dart';
import 'package:zora/presentaion/pages/user_profile/profile_screen.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({
    super.key,
    required this.mediaheight,
    required this.mediawidth,
    required this.fullnameController,
    required this.usernameController,
    required this.bioController,
    required this.emailController,
    required this.phonenoController,
    required this.user,
  });
  final UserModel user;
  final double mediaheight;
  final double mediawidth;
  final TextEditingController fullnameController;
  final TextEditingController usernameController;
  final TextEditingController bioController;
  final TextEditingController emailController;
  final TextEditingController phonenoController;

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

File? profileImage;
// File? image;
File? coverImage;

class _EditProfileWidgetState extends State<EditProfileWidget> {
  // List<AssetEntity> selectedprofileImage = [];
  // List<AssetEntity> selectedcoverImage = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: BlocConsumer<EditProfileBloc, EditProfileState>(
      listener: (context, state) {
        if (state is EditUserDetailsSuccessState) {
          customSnackbar(context, 'Profile Edited', Colors.green);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
              (route) => false);
        }
      },
      builder: (context, state) {
        return BlocConsumer<ImagePickerBloc, ImagePickerState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ProfilePicImageSuccessState) {
                profileImage = state.image;
              }
              if (state is CoverPicImageSuccessState) {
                coverImage = state.image;
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
                            Customiconsflutter.setting_line,
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
                                image: widget.user.coverPic == ""
                                    ? coverImage == null
                                        ? const AssetImage(
                                            'assets/images/placeholder cover.png')
                                        : Image.file(coverImage!).image
                                    : NetworkImage(widget.user.coverPic!),
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
                                backgroundImage: widget.user.profilePicture ==
                                        ''
                                    ? profileImage == null
                                        ? const AssetImage(
                                            'assets/images/placeholderimage.jpg')
                                        : Image.file(profileImage!).image
                                    : NetworkImage(
                                        widget.user.profilePicture!)),
                          ),
                        ),
                        Positioned(
                          bottom: widget.mediaheight * .03,
                          right: widget.mediawidth * .3,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: GestureDetector(
                              onTap: () async {
                                profileImage = await pickProfilePic();

                                // ignore: use_build_context_synchronously
                                context.read<ImagePickerBloc>().add(
                                    AddProfilePicEvent(image: profileImage!));
                              },
                              child: const Icon(
                                Customiconsflutter.edit_fill,
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
                              onTap: () async {
                                GestureDetector(
                                  onTap: () async {
                                    profileImage = await pickProfilePic();

                                    // ignore: use_build_context_synchronously
                                    context.read<ImagePickerBloc>().add(
                                        AddProfilePicEvent(
                                            image: profileImage!));
                                  },
                                  child: const Icon(
                                    Customiconsflutter.edit_fill,
                                    color: Colors.black,
                                  ),
                                );
                              },
                              child: const Icon(
                                Customiconsflutter.edit_fill,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        NormalBondTitles(titles: 'Name'),
                      ],
                    ),
                  ),
                  Textformfieldlog(
                    label: const Text('name'),
                    hint: 'Name',
                    controller: widget.fullnameController,
                    validator: (val) {
                      if (val!.length < 3) {
                        return 'Please enter a valid name';
                      }
                      return null;
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        NormalBondTitles(titles: 'Username'),
                      ],
                    ),
                  ),
                  Textformfieldlog(
                    label: const Text('username'),
                    hint: 'username',
                    controller: widget.usernameController,
                    validator: (val) {
                      if (val!.length < 4) {
                        return 'Username should have at least 4 characters';
                      }
                      if (val.endsWith('.') || val.endsWith('_')) {
                        return "Username cant't end with period or underscore";
                      }
                      if (!RegExp(
                              r"^(?=.{4,20}$)(?![_.])[a-zA-Z0-9._]+(?<![_.])$")
                          .hasMatch(val)) {
                        return 'Username can only user letters, numbers, underscore and periods';
                      }
                      return null;
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        NormalBondTitles(titles: 'Bio'),
                      ],
                    ),
                  ),
                  Textformfieldlog(
                      label: const Text('bio'),
                      hint: 'bio',
                      controller: widget.bioController),
                  kheight10,
                  Buttonelevated(
                      mediawidth: widget.mediawidth,
                      buttontext: 'Save',
                      onPressed: () {
                        context.read<EditProfileBloc>().add(EditUserDetailEvent(
                              username: widget.usernameController.text,
                              fullname: widget.fullnameController.text,
                              bio: widget.bioController.text,
                              profilePicture:
                                  profileImage ?? widget.user.profilePicture,
                              coverPicture: coverImage ?? widget.user.coverPic,
                            ));
                      }),
                ],
              );
            });
      },
    ));
  }

  // bool _canSaveChanges() {
  //   final fullname = widget.fullnameController.text;
  //   final username = widget.usernameController.text;
  //   final bio = widget.bioController.text;
  //   final user = widget.user;
  //   return fullname != user.fullName ||
  //       username != user.username ||
  //       bio != user.bio ||
  //       selectedprofileImage.isNotEmpty ||
  //       selectedcoverImage.isNotEmpty;
  // }
}
