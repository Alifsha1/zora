import 'package:flutter/material.dart';
import 'package:zora/core/icons/customiconsflutter_icons.dart';
import 'package:zora/presentaion/Widgets/elevated_button.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';
import 'package:zora/presentaion/Widgets/text_form_field.dart';

class EditProfileWidget extends StatelessWidget {
  const EditProfileWidget({
    super.key,
    required this.mediaheight,
    required this.mediawidth,
    required this.fullnameController,
    required this.usernameController,
    required this.bioController,
  });

  final double mediaheight;
  final double mediawidth;
  final TextEditingController fullnameController;
  final TextEditingController usernameController;
  final TextEditingController bioController;

  @override
  Widget build(BuildContext context) {
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
                  height: mediaheight * .26,
                  width: mediawidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/test2.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: mediaheight * .01,
                right: mediawidth * .3,
                child: const CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 63,
                    backgroundImage:
                        AssetImage('assets/images/testimage.webp'),
                  ),
                ),
              ),
              Positioned(
                bottom: mediaheight * .03,
                right: mediawidth * .3,
                child: const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Customiconsflutter.edit_fill,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                bottom: mediaheight * .11,
                right: mediawidth * .04,
                child: const CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Customiconsflutter.edit_fill,
                    color: Colors.black,
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
        Textformfieldlog(hint: 'Name', controller: fullnameController),
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
            hint: 'username', controller: usernameController),
        const Padding(
          padding: EdgeInsets.only(bottom: 5, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NormalBondTitles(titles: 'Bio'),
            ],
          ),
        ),
        Textformfieldlog(hint: 'bio', controller: bioController),
        Buttonelevated(mediawidth: mediawidth, buttontext: 'Submit'),
      ],
    );
  }
}
