// import 'package:flutter/material.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:zora/core/style/colors/colors.dart';

// class ImagePreviewScreen extends StatelessWidget {
//   final List<dynamic> images;

//   const ImagePreviewScreen({
//     super.key,
//     required this.images,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView.builder(
//           itemCount: images.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             return PhotoView(
//               imageProvider: NetworkImage(images[index]),
//               minScale: PhotoViewComputedScale.contained,
//               maxScale: PhotoViewComputedScale.covered * 2,
//               enableRotation: true,
//               //  heroAttributes: const PhotoViewHeroAttributes(tag: 'stadiumImage'),
//             );
//           }),
//       backgroundColor: kblack,
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:zora/core/style/colors/colors.dart';

class ImagePreviewScreen extends StatefulWidget {
  final List<dynamic> images;

  const ImagePreviewScreen({
    super.key,
    required this.images,
  });

  @override
  _ImagePreviewScreenState createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return PhotoView(
                imageProvider: NetworkImage(widget.images[index]),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
                enableRotation: true,
                // heroAttributes: const PhotoViewHeroAttributes(tag: 'stadiumImage'),
              );
            },
          ),
          Positioned(
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  width: _currentIndex == index ? 12.0 : 8.0,
                  height: _currentIndex == index ? 12.0 : 8.0,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? Colors.white : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      backgroundColor: kblack,
    );
  }
}
