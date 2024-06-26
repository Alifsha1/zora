import 'package:flutter/material.dart';

class AccountInfoPost extends StatelessWidget {
  const AccountInfoPost({
    super.key,
    required this.mediaheight,
    required this.mediawidth,
  });

  final double mediaheight;
  final double mediawidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                '2k',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              Text(
                'followers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          Container(
            height: mediaheight * .08,
            width: mediawidth * 0.01,
            child: VerticalDivider(
              width: 10,
              thickness: 2,
              color: Colors.grey,
              endIndent: 10,
              indent: 1,
            ),
          ),
          Column(
            children: [
              Text(
                '1k',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              Text(
                'following',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          Container(
            height: mediaheight * .08,
            width: mediawidth * 0.01,
            child: VerticalDivider(
              width: 10,
              thickness: 2,
              color: Colors.grey,
              endIndent: 10,
              indent: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                Text(
                  '52',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Posts',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}