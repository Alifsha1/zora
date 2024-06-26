import 'package:flutter/material.dart';
import 'package:zora/data/models/user_model/user_model.dart';
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
  @override
  void initState() {
    fullnameController.text = widget.user.fullName!;
    usernameController.text = widget.user.username!;
    bioController.text = widget.user.bio!;
    emailController.text = widget.user.bio!;
    phoneController.text = widget.user.phonenumber.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: EditProfileWidget(
              mediaheight: mediaheight,
              mediawidth: mediawidth,
              fullnameController: fullnameController,
              usernameController: usernameController,
              bioController: bioController),
        ),
      ),
    );
  }
}
