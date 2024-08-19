import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/presentaion/Widgets/elevated_button.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';

final Uri _url = Uri.parse(
    'https://mail.google.com/mail/u/0/#inbox?compose=CllgCJqXxrhHJPMbdqBCfSddTFkqgcbtxGMQHjPCrtkLqvRCbdgWVfLMrbXZNPrsqtTnBPFNtnV');

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaheight = MediaQuery.of(context).size.height;
    final mediawidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const BoldTitles(titles: 'Help', fontsize: 20),
        backgroundColor: maincolor,
      ),
      backgroundColor: maincolor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoldTitles(titles: 'Report a Problem?', fontsize: 20),
            kheight10,
            NormalBondTitles(
              titles: 'Send to this',
              color: kblack,
            ),
            kheight10,
            CustomSettingButton(
              mediaheight: mediawidth,
              onPressed: _launchEmail,
              mediawidth: mediawidth,
              buttontext: 'zoraofficial123@gmail.com',
              color: kblue,
            ),
          ],
        ),
      ),
    );
  }

  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path:
          'zoraofficial123@gmail.com', // Replace with the recipient's email address
      query:
          'subject=Example Subject&body=Hello, this is an example email body.',
    );

    await launchUrl(emailUri);
 
  }
}
