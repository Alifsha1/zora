import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:zora/core/style/colors/colors.dart';

class ImagePreviewScreen extends StatelessWidget {
  final List<dynamic> images;

  const ImagePreviewScreen({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: images.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return PhotoView(
              imageProvider: NetworkImage(images[index]),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 2,
              enableRotation: true,
              //  heroAttributes: const PhotoViewHeroAttributes(tag: 'stadiumImage'),
            );
          }),
      backgroundColor: kblack,
    );
  }
}
