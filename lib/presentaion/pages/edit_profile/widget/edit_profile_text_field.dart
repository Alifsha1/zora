import 'package:flutter/material.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';
import 'package:zora/presentaion/Widgets/text_form_field.dart';

class TextFieldEditProfile extends StatefulWidget {
  final TextEditingController fullnameController;
  final TextEditingController usernameController;
  final TextEditingController bioController;
  const TextFieldEditProfile(
      {super.key,
      required this.fullnameController,
      required this.usernameController,
      required this.bioController});

  @override
  State<TextFieldEditProfile> createState() => _TextFieldEditProfileState();
}

class _TextFieldEditProfileState extends State<TextFieldEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            if (!RegExp(r"^(?=.{4,20}$)(?![_.])[a-zA-Z0-9._]+(?<![_.])$")
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
      ],
    );
  }
}
