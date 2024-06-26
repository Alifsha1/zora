import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({
    super.key,
    required this.mediaheight,
    required this.mediawidth,
  });

  final double mediaheight;
  final double mediawidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        image: const DecorationImage(
          image: AssetImage('assets/images/testimage.webp'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              height: mediaheight * 0.07,
              width: mediawidth * 0.4,
              decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(.5),
                  borderRadius: BorderRadius.circular(30)),
              child: const Padding(
                padding: EdgeInsets.all(7.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: Colors.white,
                    ),
                    Column(
                      children: [
                        Text(
                          'alifsha',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('1 day ago',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: CircleAvatar(
                radius: 23,
                backgroundColor: Colors.transparent.withOpacity(.5),
                child: Builder(builder: (BuildContext context) {
                  return PopupMenuButton<String>(
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                      color: Colors.transparent.withOpacity(0.5),
                      onSelected: (String value) {},
                      itemBuilder: (BuildContext context) {
                        return [
                          const PopupMenuItem(
                            child: Text(
                              'Save',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const PopupMenuItem(
                            child: Text(
                              'Delete',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ];
                      });
                })
                ),
          ),
          const Positioned(
            bottom: 50,
            left: 20,
            child: Icon(
              FeatherIcons.heart,
              size: 25,
              color: Colors.white,
            ),
          ),
          const Positioned(
            bottom: 50,
            left: 50,
            child: Text(
              '3568',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            bottom: 50,
            left: 100,
            child: Icon(
              FeatherIcons.messageCircle,
              size: 25,
              color: Colors.white,
            ),
          ),
          const Positioned(
            bottom: 50,
            left: 130,
            child: Text(
              '3568',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 20,
            child: Text(
              'Hello, World!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
