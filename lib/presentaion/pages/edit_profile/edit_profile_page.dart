import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/Widgets/zora.dart';
import 'package:zora/presentaion/bloc/edit_profile/edit_profile_bloc.dart';
import 'package:zora/presentaion/pages/edit_profile/widget/edip_profile_widget.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel user;
  const EditProfileScreen({super.key, required this.user});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  File? profileImage;
// File? image;
  File? coverImage;
  String profileImageUrl = '';
  String coverpicImageUrl = '';

  // @override
  // void initState() {
  //   profileImageUrl = widget.user.profilePicture ?? '';
  //   coverpicImageUrl = widget.user.coverPic ?? '';
  //   log('Profile Image Url: $profileImageUrl');
  //   super.initState();
  // }
  @override
  void initState() {
    fullnameController.text = widget.user.fullName!;
    usernameController.text = widget.user.username!;
    bioController.text = widget.user.bio!;
    emailController.text = widget.user.bio!;
    phoneController.text = widget.user.phonenumber.toString();
    profileImageUrl = widget.user.profilePicture ?? '';
    coverpicImageUrl = widget.user.coverPic ?? '';
    log('Profile Image Url: $profileImageUrl');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          title: const MainHeading(heading: 'Edit Profile'),
          backgroundColor: const Color.fromARGB(255, 228, 246, 246),
          actions: [
            GestureDetector(
                onTap: () {
                  context.read<EditProfileBloc>().add(EditUserDetailEvent(
                        username: usernameController.text,
                        fullname: fullnameController.text,
                        bio: bioController.text,
                        profilePicture:
                            profileImage ?? widget.user.profilePicture,
                        coverPicture: coverImage ?? widget.user.coverPic,
                      ));
                },
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: EditProfileWidget(
            user: widget.user,
            mediaheight: mediaheight,
            mediawidth: mediawidth,
            fullnameController: fullnameController,
            usernameController: usernameController,
            bioController: bioController,
  
            coverimage: coverImage,
            coverpicImageUrl: coverpicImageUrl,
            profileImageUrl: profileImageUrl,
            profileimage: profileImage,
          ),
        ),
      ),
    );
  }
}
