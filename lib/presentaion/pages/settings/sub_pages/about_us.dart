import 'package:flutter/material.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';
import 'package:zora/presentaion/pages/settings/utils/utils.dart';
import 'package:zora/presentaion/pages/settings/utils/utils_test_style.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const BoldTitles(titles: 'About Us', fontsize: 20),
        backgroundColor: maincolor,
      ),
      backgroundColor: maincolor,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
        children: [
          _heading(context),
          content(AboutUs.about),
          //  kHeight(15),
          kheight10,
          content(AboutUs.stayTuned),

          kheight20,
          _heading2('Features:'),
          bulletedList(AboutUs.featureTitle, AboutUs.features),
          kheight20,
          _heading2('Our Vision:'),
          kheight5,
          content(AboutUs.ourVision),
        ],
      ),
    );
  }

  Text _heading2(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Text _heading(BuildContext context) {
    return const Text(
      'Welcome to Zora!',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 2,
        color: kblack,
      ),
    );
  }
}
