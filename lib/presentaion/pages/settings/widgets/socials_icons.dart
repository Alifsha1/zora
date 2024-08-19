import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';

class SocialsIcons extends StatelessWidget {
  const SocialsIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'FOLLOW OUR SOCIALS',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0x33000000),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FeatherIcons.instagram,
                size: 14,
                color: Color(0x33000000),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                FeatherIcons.twitter,
                color: Color(0x33000000),
                size: 14,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                FeatherIcons.facebook,
                size: 14,
                color: Color(0x33000000),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                FeatherIcons.linkedin,
                size: 14,
                color: Color(0x33000000),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'v2.0.1',
            style: TextStyle(
                color: Color(0x1A000000),
                fontSize: 11,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
